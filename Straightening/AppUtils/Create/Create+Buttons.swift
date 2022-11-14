//
//  Create.swift
//  Straightening
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import UIKit

struct Create {
    static func baseButton(_ title: String? = nil,
                           titleColor: UIColor? = nil,
                           backgroundColor: UIColor? = nil,
                           for control: UIControl.Event? = nil,
                           handler: UIActionHandler? = nil) -> UIButton {
        let baseButton = UIButton()
        baseButton.translatesAutoresizingMaskIntoConstraints = false
        baseButton.setTitle(title, for: .normal)
        baseButton.setTitleColor(titleColor, for: .normal)
        baseButton.backgroundColor = backgroundColor
        if let handler = handler {baseButton.addAction(UIAction(handler: handler), for: control ?? .touchUpInside)}
        return baseButton
    }
    static func button(_ text: String? = nil,
                       titleColor: UIColor? = nil,
                       cornerRadius: CGFloat = 15,
                       backgroundColor: UIColor? = nil,
                       for control: UIControl.Event? = nil,
                       handler: UIActionHandler? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = backgroundColor
        if let handler = handler {button.addAction(UIAction(handler: handler), for: control ?? .touchUpInside)}
        return button
    }
}
