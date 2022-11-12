//
//  Create+TextFields.swift
//  Straightening
//
//  Created by Josicleison Elves on 20/08/1401 AP.
//

import UIKit

extension Create {
    static func textField(for control: UIControl.Event? = nil,
                          handler: UIActionHandler? = nil) -> UITextField {
        let textField = UITextField()
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        if let handler = handler {textField.addAction(UIAction(handler: handler), for: control ?? .editingChanged)}
        return textField
    }
}
