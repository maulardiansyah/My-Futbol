//
//  StandingsTableCell.swift
//  My Futbol
//
//  Created by Maul on 16/07/21.
//

import UIKit

class StandingsTableCell: UITableViewCell {

    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var imgClub: UIImageView!
    @IBOutlet weak var lblNameClub: UILabel!
    
    @IBOutlet weak var lblPlay: UILabel!
    @IBOutlet weak var lblWin: UILabel!
    @IBOutlet weak var lblDraw: UILabel!
    @IBOutlet weak var lblLost: UILabel!
    @IBOutlet weak var lblPts: UILabel!
    
    static let cellId = "standingListCell"
    
    static func standingsCellNib() -> UINib {
        return UINib(nibName: "StandingsTableCell", bundle: nil)
    }
    
    var club: mTeamStanding? {
        didSet {
            lblPosition.text = club?.stats?[8].displayValue ?? "" + "."
            imgClub.setImage(club?.team?.logos?.first?.href ?? "")
            lblNameClub.text = club?.team?.name ?? ""
            
            lblPlay.text = club?.stats?[3].displayValue ?? "0"
            lblWin.text = club?.stats?[0].displayValue ?? "0"
            lblDraw.text = club?.stats?[2].displayValue ?? "0"
            lblLost.text = club?.stats?[1].displayValue ?? "0"
            lblPts.text = club?.stats?[6].displayValue ?? "0"
            
            let colorView = club?.note?.color ?? ""
            indicatorView.backgroundColor = club?.note == nil ? .white : colorView.hexToColor()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        separator.backgroundColor = .grayStroke
    }
}
