//
//  ListLeague.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

import UIKit
import ImageSlideshow

class ListLeagueView: BaseVC {
    
    @IBOutlet weak var carouselHeader: ImageSlideshow!
    @IBOutlet weak var collectionLeague: UICollectionView!
    
    let leagueCellId = "LeagueCellId"
    
    var leagueVM = [LeagueViewModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCarousel()
        setupCollectionLeague()
    }
    
   


    //MARK: - Setup Views
    func setupCarousel() {
        carouselHeader.backgroundColor = .clear
        carouselHeader.slideshowInterval = 2.5
        carouselHeader.contentScaleMode = .scaleAspectFill
        
        
    }
    
    func setupCollectionLeague() {
        collectionLeague.register(LeagueCollCell.self, forCellWithReuseIdentifier: leagueCellId)
        collectionLeague.delegate = self
        collectionLeague.dataSource = self
    }
}

//MARK: - Collection Data
extension ListLeagueView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

