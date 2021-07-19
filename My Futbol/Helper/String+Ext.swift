//
//  String+Ext.swift
//  My Futbol
//
//  Created by Maul on 19/07/21.
//

import UIKit

extension String {
    
    /// Convert Hex String to UIColor
    func hexToColor() -> UIColor {
        let strTemp = self.replacingOccurrences(of: "#", with: "")
        let convertHex = UInt(String(strTemp.suffix(6)), radix: 16) ?? 0
        return UIColor().UIColorRGB(rgbValue: convertHex)
    }
}
