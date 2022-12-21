//
//  BaseButton.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

class BaseButton: UIButton {
    init(_ title: String? = nil,
         titleColor: UIColor? = .reverseDark,
         backgroundColor: UIColor? = .weakWhite,
         for control: UIControl.Event? = nil,
         handler: UIActionHandler? = nil) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        if let handler = handler {addAction(UIAction(handler: handler), for: control ?? .touchUpInside)}
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @discardableResult func performSelection(condition: Bool) -> Bool {
        if condition {
            unFreezeButton()
        } else {
            freezeButton()
        }
        return condition
    }
    func freezeButton() {
        alpha = 0.5
        isUserInteractionEnabled = false
    }
    func unFreezeButton() {
        alpha = 1
        isUserInteractionEnabled = true
    }
}
