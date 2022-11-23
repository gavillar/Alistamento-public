//
//  UIView+Background.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import UIKit

extension UIView {
    func defaultBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.lightGreen?.cgColor as Any]
        layer.insertSublayer(gradient, at: 0)
    }
}
