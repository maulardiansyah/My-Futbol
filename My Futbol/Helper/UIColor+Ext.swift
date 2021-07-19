//
//  UIImage+Ext.swift
//  My Futbol
//
//  Created by Maul on 19/07/21.
//

import UIKit

extension UIColor {
    func UIColorRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            displayP3Red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}
