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
    func removeSubviews<T>(ofType: T.Type) {
        for subview in subviews where (subview as? T) != nil {
            subview.removeFromSuperview()
        }
    }
    func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
