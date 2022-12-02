//
//  BaseButton.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

protocol BaseButtonDelegate: AnyObject {
    func freezeButton()
    func unFreezeButton()
}

class BaseButton: UIButton {
    weak var delegate: BaseButtonDelegate?
    init(_ title: String? = nil,
         titleColor: UIColor? = Assets.Colors.reverseDark,
         backgroundColor: UIColor? = Assets.Colors.weakWhite,
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
    func performSelection(condition: Bool) -> Bool {
        if condition {
            delegate?.unFreezeButton()
        } else {
            delegate?.freezeButton()
        }
        return condition
    }
}
