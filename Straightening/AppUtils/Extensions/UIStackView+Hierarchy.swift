//
//  uiStackView+Hierarchy.swift
//  Straightening
//
//  Created by user220831 on 11/10/22.
//

import UIKit

extension UIStackView {
    func removeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
