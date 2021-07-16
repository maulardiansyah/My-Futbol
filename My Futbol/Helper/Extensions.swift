//
//  Extensions.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//
import Kingfisher
import Toast_Swift

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

/// UIView
extension UIView
{
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func showToast(_ message: String, duration: TimeInterval = 2.0, position: ToastPosition = .bottom, bgColor: UIColor = UIColor.black.withAlphaComponent(0.8)) {
        var style = ToastStyle()
        style.backgroundColor = bgColor
        self.makeToast(message, duration: duration, position: position, style: style)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

/// String
extension String
{
    func datePrefixTimezone() -> String {
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
