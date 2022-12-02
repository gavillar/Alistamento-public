//
//  UiStackView.swift
//  br.com.foursys.crud
//
//  Created by user220831 on 6/6/22.
//

import UIKit

extension CALayer {
    func setUnderlineBorderWhite() {
        let layer = CALayer()
        layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.frame = CGRect(x: -10, y: 50, width: UIScreen.main.bounds.width * 0.85, height: 1)
        addSublayer(layer)
    }
}
