//
//  UiStackView.swift
//  br.com.foursys.crud
//
//  Created by user220831 on 6/6/22.
//

import Foundation
import UIKit

extension UIStackView {
    func setUnderlineBorder() {
        let border = CALayer()
        let defaultWidht = UIScreen.main.bounds.width * 0.85
        border.borderColor = UIColor.init(red: 28/255, green: 28/255, blue: 28/255, alpha: 1).cgColor
        border.borderWidth = 1
        border.frame = CGRect(x: -10, y: 35, width: defaultWidht, height: 0.7)
        self.layer.addSublayer(border)
    }
}
