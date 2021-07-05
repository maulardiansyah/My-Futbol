//
//  LeagueCollCell.swift
//  My Futbol
//
//  Created by Maul on 04/07/21.
//

import UIKit

class LeagueCollCell: BaseCollectionViewCell {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imgLeague: UIImageView!
    @IBOutlet weak var lblNameLeague: UILabel!
    
    var league: mLeague? {
        didSet {
            
        }
    }
    
    override func setupViews() {
        super.setupViews()
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
