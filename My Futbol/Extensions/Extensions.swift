//
//  Extensions.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//
import Kingfisher

/// UI Image View
extension UIImageView
{
    func setImage(_ urlstring: String, placeholder: UIImage? = nil) {
        if let url = URL(string: urlstring) {
            self.contentMode = .scaleAspectFill
            self.clipsToBounds = true
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: placeholder,
                options: [.transition(.fade(1))],
                progressBlock: nil,
                completionHandler: { result in })
        }
    }
}

/// String
extension String
{
    func datePrefixTimezon() -> String {
        return "\(self.prefix(10))"
    }
    
    func hexToColor() -> UIColor {
        let strTemp = self.replacingOccurrences(of: "#", with: "")
        let convertHex = UInt(String(strTemp.suffix(6)), radix: 16) ?? 0
        return UIColor().UIColorRGB(rgbValue: convertHex)
    }
}

/// UIColor
extension UIColor
{
    func UIColorRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            displayP3Red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}
