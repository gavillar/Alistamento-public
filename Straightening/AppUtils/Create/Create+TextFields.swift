//
//  Create+TextFields.swift
//  Straightening
//
//  Created by Josicleison Elves on 20/08/1401 AP.
//

import UIKit

extension Create {
    static func textField(textColor: UIColor? = .white,
                          placeholder: String? = nil,
                          for control: UIControl.Event? = nil,
                          keyboard: UIKeyboardType? = nil,
                          handler: UIActionHandler? = nil) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = Assets.Colors.moreWeakWhite
        textField.addUnderline()
        if let keyboard = keyboard {
            textField.keyboardType = keyboard
        }
        textField.textColor = textColor
        if let placeholder = placeholder {
            textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                 attributes: [
                                                                    NSAttributedString.Key.foregroundColor:
                                                                        Assets.Colors.whiteBlack as Any
                                                                 ])
        }
        textField.translatesAutoresizingMaskIntoConstraints = false
        if let handler = handler {textField.addAction(UIAction(handler: handler), for: control ?? .editingChanged)}
        return textField
    }
}
