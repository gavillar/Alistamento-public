//
//  Create+Stacks.swift
//  Straightening
//
//  Created by Josicleison Elves on 20/08/1401 AP.
//

import UIKit

extension Create {
    static func stack(_ spacing: CGFloat = 20,
                      backgroundColor: UIColor? = nil,
                      layoutMargins: UIEdgeInsets =  UIEdgeInsets(top: 20,
                                                                  left: 15,
                                                                  bottom: 20,
                                                                  right: 15),
                      arrangedSubviews: [UIView] = [],
                      axis: NSLayoutConstraint.Axis = .vertical,
                      cornerRadius: CGFloat = 15) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.spacing = spacing
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = layoutMargins
        stack.layer.cornerRadius = cornerRadius
        stack.backgroundColor = backgroundColor
        return stack
    }
}
