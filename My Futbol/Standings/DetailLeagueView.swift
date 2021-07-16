//
//  DetailLeagueView.swift
//  My Futbol
//
//  Created by Maul on 16/07/21.
//

import UIKit

class DetailLeagueView: BaseVC {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var containerTable: UIView!
    @IBOutlet weak var imgLeague: UIImageView!
    @IBOutlet weak var lblLeagueName: UILabel!
    @IBOutlet weak var lblAbbrLeague: UILabel!
    
    var leagueId = ""
    var seasonSelected = ""
    
    var league: mLeague?
    var listSeason = [mSeasonLeague]()
    var standingDetail: mSeasonStandingDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeaderValue()
        setTitle("League Detail")
    }
    
//MARK: - Configure View
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .bgSoftBlue
        headerView.backgroundColor = .bgSoftBlue
        lblAbbrLeague.textColor = .gray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerTable.roundCorners(corners: [.topLeft, .topRight], radius: 28)
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
        Network.request(.getSeasonAvalilable(leagueId)) { resData, error in
            if let e = error {
                self.view.showToast(e)
            } else {
                if let data = resData, let season = try? JSONDecoder().decode(mSeasonAvailable.self, from: data) {
                    self.listSeason = season.data ?? []
                } else {
                    self.view.showToast("Failed decode data.")
                }
            }
        }
    }
    
    func apiGetStandings() {
        Network.request(.getStandings(leagueId, seasonSelected)) { resData, error in
            if let e = error {
                self.view.showToast(e)
            } else {
                if let data = resData, let standings = try? JSONDecoder().decode(mStandingsLeague.self, from: data) {
                    self.standingDetail = standings.data
                } else {
                    self.view.showToast("Failed decode data.")
                }
            }
        }
    }
}
