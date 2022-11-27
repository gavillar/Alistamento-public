//
//  UITextfield+Border.swift
//  Straightening
//
//  Created by user220831 on 11/27/22.
//

import Foundation
import UIKit

extension UITextField {
    func setUnderlineTextFieldBorderWhite() {
        let border = CALayer()
        let defaultWidht = UIScreen.main.bounds.width * 0.85
        border.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        border.borderWidth = 1
        border.frame = CGRect(x: -10, y: 50, width: defaultWidht, height: 1)
        self.layer.addSublayer(border)
    }
}
