//
//  BaseVC.swift
//  My Futbol
//
//  Created by Maul on 04/07/21.
//

import UIKit

class BaseVC: UIViewController
{
    var titleText = ""
    var subtitleText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setNavigation()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation(isHidden: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /// remove title on back button
        navigationItem.title = " "
    }
    
    func setTitle(_ title: String, subtitle: String = "", titleColor: UIColor = .darkBlue) {
        let navbarH = self.navigationController?.navigationBar.frame.height ?? 0
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: navbarH))
        label.textAlignment = .left
        label.text = title
        label.numberOfLines = 0
        label.textColor = titleColor
        
        let attributText = NSMutableAttributedString()
        
        var boldText = "\(title)"
        if(subtitle != ""){ boldText += "\n" }
        let boldAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]
        let boldAttributedString = NSMutableAttributedString(string:boldText, attributes:boldAttrs as [NSAttributedString.Key : Any])
        
        let normalText = "\(subtitle)"
        let normalAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light)]
        let normalAttributedString = NSMutableAttributedString(string:normalText, attributes:normalAttrs as [NSAttributedString.Key : Any])
        
        attributText.append(boldAttributedString)
        attributText.append(normalAttributedString)
        
        label.attributedText = attributText
        navigationItem.titleView = label
    }
    
    func setNavigation(barTintColor: UIColor = .white, tintColor: UIColor = .darkBlue) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = barTintColor
        navigationController?.navigationBar.tintColor = tintColor
    }
    
    func setNavigation(isHidden: Bool, animated: Bool = false) {
        navigationController?.setNavigationBarHidden(isHidden, animated: animated)
    }
    
    func setNavigationRightButtons(titles: [String], icons: [UIImage?]) {
        var rh = [UIBarButtonItem?](repeating: nil, count: titles.count)
        for i in 0 ..< rh.count {
            if icons.count > 0 {
                rh[i] = UIBarButtonItem(image: icons[i]?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(rightButtonPressed(sender:)))
                rh[i]?.title = titles[i]
            } else {
                rh[i] = UIBarButtonItem(title: titles[i], style: .plain, target: self, action: #selector(rightButtonPressed(sender:)))
            }
        }
        navigationItem.rightBarButtonItems = rh as? [UIBarButtonItem]
    }
    
    @objc func rightButtonPressed(sender : UIBarButtonItem) { }
    
    func setupViews() {}
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("\(getClassName()) \(#function)")
    }
    
    func getClassName() -> String {
        return String(describing: classForCoder)
    }

    @objc func buttonPressed(_ sender: UIButton) { }
}

