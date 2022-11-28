//
//  UIView+Background.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import UIKit

extension UIView {
    func defaultBackground() {
        guard let sublayers = layer.sublayers else {return}
        for layer in sublayers where (layer as? CAGradientLayer) != nil {
            layer.removeFromSuperlayer()
        }
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [Assets.Colors.purple?.cgColor as Any,
                           Assets.Colors.blue?.cgColor as Any,
                           Assets.Colors.red?.cgColor as Any,
                           Assets.Colors.orange?.cgColor as Any]
        layer.insertSublayer(gradient, at: 0)
    }
}
