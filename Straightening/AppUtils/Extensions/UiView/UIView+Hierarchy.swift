//
//  UIView.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    func removeSubLayers(_ condition: Bool = true) {
        guard let sublayers = layer.sublayers else {return}
        for layer in sublayers where condition {
            layer.removeFromSuperlayer()
        }
    }
}
