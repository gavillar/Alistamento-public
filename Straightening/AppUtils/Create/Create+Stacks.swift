//
//  Create+Stacks.swift
//  Straightening
//
//  Created by Josicleison Elves on 20/08/1401 AP.
//

import UIKit

extension Create {
    static func stack(_ spacing: CGFloat = 0,
                      backgroundColor: UIColor? = nil,
                      layoutMargins: UIEdgeInsets? = nil,
                      arrangedSubviews: [UIView] = [],
                      axis: NSLayoutConstraint.Axis = .vertical) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.distribution = .equalSpacing
        stack.spacing = spacing
        if let layoutMargins = layoutMargins {
            stack.isLayoutMarginsRelativeArrangement = true
            stack.layoutMargins = layoutMargins
        }
        stack.backgroundColor = backgroundColor
        return stack
    }
}
