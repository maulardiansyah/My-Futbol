//
//  UIView+Ext.swift
//  My Futbol
//
//  Created by Maul on 19/07/21.
//

import UIKit
import Toast_Swift

extension UIView {
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
