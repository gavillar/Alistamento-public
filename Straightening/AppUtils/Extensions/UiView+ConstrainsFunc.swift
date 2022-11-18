//
//  UiView+ConstrainsFunc.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation
import UIKit



extension UIView {

    @discardableResult
    func enableAutolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func centerX(in view: UIView) -> Self {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }

    @discardableResult
    func centerY(in view: UIView) -> Self {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }

    @discardableResult
    func width( _ anchor: NSLayoutDimension , multiplier: CGFloat = 1 ) -> Self {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func height( _ anchor: NSLayoutDimension , multiplier: CGFloat = 1 ) -> Self {
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func width( _ value: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: value).isActive = true
        return self
    }

    @discardableResult
    func height( _ value: CGFloat ) -> Self {
        heightAnchor.constraint(equalToConstant: value).isActive = true
        return self
    }
}
