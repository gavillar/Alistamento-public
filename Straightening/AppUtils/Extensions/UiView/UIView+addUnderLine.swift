//
//  UIView+addUnderLine.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

extension UIView {
    func addUnderline(_ spacing: CGFloat = 0) {
        let line = UIView()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints = false
        addSubview(line)
        addConstraints([
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
            line.bottomAnchor.constraint(equalTo: bottomAnchor,
                                         constant: spacing),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
