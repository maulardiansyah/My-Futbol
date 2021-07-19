//
//  UIImageView+Ext.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

import Kingfisher
import UIKit

extension UIImageView {
    func setImage(_ urlstring: String, placeholder: UIImage? = nil) {
        if let url = URL(string: urlstring) {
            self.contentMode = .scaleAspectFill
            self.clipsToBounds = true
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: placeholder,
                options: [.transition(.fade(1))],
                completionHandler: { result in })
        }
    }
}
