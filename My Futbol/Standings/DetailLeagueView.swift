//
//  DetailLeagueView.swift
//  My Futbol
//
//  Created by Maul on 16/07/21.
//

import UIKit
import DropDown

class DetailLeagueView: BaseVC {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var containerTable: UIView!
    @IBOutlet weak var imgLeague: UIImageView!
    @IBOutlet weak var lblLeagueName: UILabel!
    @IBOutlet weak var lblAbbrLeague: UILabel!
    @IBOutlet weak var tableStandings: UITableView!
    
    @IBOutlet weak var selectedSeason: UIView!
    @IBOutlet weak var lblOptioSelectSeason: UIButton!
    @IBOutlet weak var imgSelectSeason: UIView!
    @IBOutlet weak var lblSelectedSeason: UILabel!
    @IBOutlet weak var separator: UIView!
    
    let seasonOpt = DropDown()
    
    var leagueId = ""
    var seasonSelected = ""
    
    var league: mLeague?
    var detailSeason: mSeasonLeague?
    var standingDetail: mSeasonStandingDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiGetSeason()
        setHeaderValue()
        setTitle("League Detail")
    }
    
    @objc func showSeasonnAvailabe() {
        setupDropdown()
    }
    
//MARK: - Configure View
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .bgSoftBlue
        headerView.backgroundColor = .bgSoftBlue
        lblAbbrLeague.textColor = .gray
        separator.backgroundColor = .grayStroke
        imgSelectSeason.tintColor = .darkBlue
        
        tableStandings.register(StandingsTableCell.standingsCellNib(), forCellReuseIdentifier: StandingsTableCell.cellId)
        tableStandings.delegate = self
        tableStandings.dataSource = self
        
        selectedSeason.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showSeasonnAvailabe)))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerTable.roundCorners(corners: [.topLeft, .topRight], radius: 28)
    }
    
//MARK: - Triggred DropDown
    func setupDropdown() {
        seasonOpt.anchorView = selectedSeason
        seasonOpt.selectionAction = { (index, value) in
            self.setSeasonSelected(value, index)
        }
        seasonOpt.dataSource = detailSeason?.seasons?.map { "\($0.year ?? 0)" } ?? []
        seasonOpt.show()
    }
    
    func setSeasonSelected(_ value: String, _ index: Int) {
        lblOptioSelectSeason.setTitle(value, for: .normal)
        seasonSelected = "\(detailSeason?.seasons?[index].year ?? 0)"
        apiGetStandings(isFirst: false)
    }
}

//MARK: Table Data
extension DetailLeagueView: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingDetail?.standings?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StandingsTableCell.cellId, for: indexPath) as! StandingsTableCell
        cell.club = standingDetail?.standings?[indexPath.row]
        return cell
    }
}

//MARK: - Set Data & API
extension DetailLeagueView
{
    func setHeaderValue() {
        lblLeagueName.text = league?.name ?? ""
        lblAbbrLeague.text = league?.abbr ?? ""
        imgLeague.setImage(league?.logos?.light ?? "")
    }
    
    func apiGetSeason() {
        tableStandings.showAnimatedGradientSkeleton()
        selectedSeason.showAnimatedGradientSkeleton()
        Network.request(.getSeasonAvalilable(leagueId)) { resData, error in
            if let e = error {
                self.view.showToast(e)
            } else {
                if let data = resData, let season = try? JSONDecoder().decode(mSeasonAvailable.self, from: data) {
                    self.detailSeason = season.data
                    self.seasonSelected = "\(season.data?.seasons?.first?.year ?? 0)"
                    self.lblOptioSelectSeason.setTitle(self.seasonSelected, for: .normal)
                    self.apiGetStandings(isFirst: true)
                } else {
                    self.view.showToast("Failed decode data.")
                }
            }
            
            DispatchQueue.main.async {
                self.selectedSeason.hideSkeleton()
            }
        }
    }
    
    func apiGetStandings(isFirst: Bool) {
        if isFirst == false {
            tableStandings.showAnimatedGradientSkeleton()
        }
        Network.request(.getStandings(leagueId, seasonSelected)) { resData, error in
            if let e = error {
                self.view.showToast(e)
            } else {
                if let data = resData, let standings = try? JSONDecoder().decode(mStandingsLeague.self, from: data) {
                    self.standingDetail = standings.data
                    self.lblSelectedSeason.text = "Season: \(standings.data?.seasonDisplay ?? "")"
                } else {
                    self.view.showToast("Failed decode data.")
                }
            }
            
            DispatchQueue.main.async {
                self.tableStandings.reloadData()
                self.tableStandings.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            }
        }
    }
}
