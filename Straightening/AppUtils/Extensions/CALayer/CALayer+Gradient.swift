//
//  UIView+Background.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import UIKit

extension CALayer {
    func addGradientBackground(frame: CGRect,
                               colors: [CGColor?] = [Assets.Colors.purple?.cgColor,
                                                     Assets.Colors.blue?.cgColor,
                                                     Assets.Colors.red?.cgColor,
                                                     Assets.Colors.orange?.cgColor]) {
        removeSubLayers(ofType: CAGradientLayer.self)
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors as [Any]
        insertSublayer(gradient, at: 0)
    }
}
