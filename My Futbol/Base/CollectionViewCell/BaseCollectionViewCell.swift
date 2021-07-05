//
//  BaseCollectionViewCell.swift
//  My Futbol
//
//  Created by Maul on 04/07/21.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.alpha = isHighlighted ? 0.8 : 1.0
        }
    }
    
    func setupViews() { }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
