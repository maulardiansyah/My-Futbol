//
//  LeagueCollCell.swift
//  My Futbol
//
//  Created by Maul on 04/07/21.
//

import UIKit

class LeagueCollCell: UICollectionViewCell {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imgLeague: UIImageView!
    @IBOutlet weak var lblNameLeague: UILabel!
    
    static let cellId = "leagueListCell"
    
    static func leagueCellNib() -> UINib {
        return UINib(nibName: "LeagueCollCell", bundle: nil)
    }
    
    var league: League? {
        didSet {
            lblNameLeague.text = league?.name ?? ""
            imgLeague.setImage(league?.logos?.light ?? "")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear

        setupLabel()
        setupContainer()
    }

    //MARK: - Setup Component
    func setupLabel() {
        lblNameLeague.textColor = .darkBlue
    }

    func setupContainer() {
        container.layer.cornerRadius = 8
    }
}
