//
//  ListLeague.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

import UIKit
import ImageSlideshow
import SkeletonView

class ListLeagueView: BaseVC {
    
    @IBOutlet weak var carouselHeader: ImageSlideshow!
    @IBOutlet weak var collectionLeague: UICollectionView!
    
    var listLeague = [mLeague]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle("My Futbol")
        setImgHeader()
        apiGetListLeague()
    }
    
//MARK: - Configure View
    override func setupViews() {
        super.setupViews()
        
        setupCarousel()
        setupCollectionLeague()
    }

    func setupCarousel() {
        carouselHeader.backgroundColor = .clear
        carouselHeader.slideshowInterval = 2.5
        carouselHeader.contentScaleMode = .scaleAspectFill
    }
    
    func setupCollectionLeague() {
        collectionLeague.register(LeagueCollCell.leagueCellNib(), forCellWithReuseIdentifier: LeagueCollCell.cellId)
        collectionLeague.backgroundColor = .bgSoftBlue
        collectionLeague.delegate = self
        collectionLeague.dataSource = self
    }
}

//MARK: - Collection Data
extension ListLeagueView: SkeletonCollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        LeagueCollCell.cellId
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listLeague.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollCell.cellId, for: indexPath) as! LeagueCollCell
        cell.league = listLeague[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 10, bottom: 16, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let colCount = 3 // Jumlah Kolom
        let margin: CGFloat = 4 * 2
        let width = (frame.width - CGFloat((colCount - 1) * 12)) - margin
        var estimatedWidth = width / CGFloat(colCount)
        estimatedWidth.round(.down)
        return .init(width: estimatedWidth, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectLeague(listLeague[indexPath.row])
    }
    
    func selectLeague(_ league: mLeague) {
        let vc =  UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailLeague") as! DetailLeagueView
        
        let leagueIdTemp = league.id ?? ""
        vc.leagueId = leagueIdTemp == "eps.1" ? "esp.1" : leagueIdTemp ///karena aslinya kodenya esp.1 buat dapetin data, tetapi respon dari open api typo jadi "eps.1"
        vc.league = league
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

//MARK: - Set Data & API
extension ListLeagueView
{
    func setImgHeader() {
        let imgCarousel = [
            "https://images.daznservices.com/di/library/GOAL/9c/d9/marco-verratti-italy-kevin-de-bruyne-belgium-euro-2020_4tog0oastsy81axw0qrfavh9c.jpg?t=1849119754&amp;quality=60&amp;w=1000",
            "https://images.daznservices.com/di/library/GOAL/6/16/rodrigo-de-paul-argentina-ecuador-copa-america-03072021_rxucdpsayopj1dpotxexif0ou.jpg?t=1872578362&amp;quality=60&amp;w=1000",
            "https://images.daznservices.com/di/library/GOAL/fb/92/wayne-rooney-derby-2020-21_ayqm68eooslb13r92f7vt5nri.jpg?t=1324765593&amp;quality=60&amp;w=600"
        ]
        
        var sources = [InputSource]()
        for i in 0..<imgCarousel.count {
            if let url = URL(string: imgCarousel[i]) {
                sources.append(KingfisherSource(url: url))
            }
        }
        carouselHeader.setImageInputs(sources)
    }
    
    func apiGetListLeague() {
        collectionLeague.showAnimatedGradientSkeleton()
        Network.request(.getAllLeagues) { resData, error in
            if let e = error {
                self.view.showToast(e)
            } else {
                if let data = resData, let league = try? JSONDecoder().decode(mAllLeagues.self, from: data) {
                    self.listLeague = league.data ?? []
                } else {
                    self.view.showToast("Failed decode data.")
                }
            }
            
            DispatchQueue.main.async {
                self.collectionLeague.reloadData()
                self.collectionLeague.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            }
        }
    }
}

