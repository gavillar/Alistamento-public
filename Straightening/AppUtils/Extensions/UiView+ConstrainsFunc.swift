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
    func constraint(_ attribute: NSLayoutConstraint.Attribute,
                    relatedBy: NSLayoutConstraint.Relation = .equal,
                    to item: Any? = nil,
                    itemAttribute: NSLayoutConstraint.Attribute? = nil,
                    multiplier: CGFloat = 1,
                    constant: CGFloat = 0) -> Self {
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: attribute,
                                                    relatedBy: relatedBy,
                                                    toItem: item ?? superview,
                                                    attribute: itemAttribute ?? attribute,
                                                    multiplier: multiplier,
                                                    constant: constant))
        return self
    }

    @discardableResult
    func enableAutolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func centerX(in view: UIView? = nil, constant: CGFloat = 0) -> Self {
        if let view = view {
            centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                     constant: constant).isActive = true
        }
        else if let superview = superview {
            centerXAnchor.constraint(equalTo: superview.centerXAnchor,
                                     constant: constant).isActive = true
        }
        return self
    }

    @discardableResult
    func centerY(in view: UIView? = nil, constant: CGFloat = 0) -> Self {
        if let view = view {
            centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                     constant: constant).isActive = true
        }
        else if let superview = superview {
            centerYAnchor.constraint(equalTo: superview.centerYAnchor,
                                     constant: constant).isActive = true
        }
        return self
    }
    
    @discardableResult
    func top(in view: Any? = nil, constant: CGFloat = 0) -> Self {
        return constraint(.top, to: view)
    }
    
    @discardableResult
    func leading(in view: Any? = nil, constant: CGFloat = 0) -> Self {
        return constraint(.leading, to: view)
    }
    
    @discardableResult
    func trailing(in view: Any? = nil, constant: CGFloat = 0) -> Self {
        return constraint(.trailing, to: view)
    }
    
    @discardableResult
    func bottom(in view: Any? = nil, constant: CGFloat = 0) -> Self {
        return constraint(.bottom, to: view)
    }

    @discardableResult
    func width( _ anchor: NSLayoutDimension, multiplier: CGFloat = 1 ) -> Self {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult
    func height( _ anchor: NSLayoutDimension, multiplier: CGFloat = 1 ) -> Self {
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
    
    @discardableResult
    func width(in view: Any? = nil, multiplier: CGFloat = 1 ) -> Self {
        return constraint(.width, to: view, multiplier: multiplier)
    }
    
    @discardableResult
    func height(in view: Any? = nil, multiplier: CGFloat = 1 ) -> Self {
        return constraint(.height, to: view, multiplier: multiplier)
    }
}
