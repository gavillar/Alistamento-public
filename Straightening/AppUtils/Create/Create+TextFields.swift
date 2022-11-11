//
//  Create+TextFields.swift
//  Straightening
//
//  Created by Josicleison Elves on 20/08/1401 AP.
//

import UIKit

extension Create {
    static func textField() -> UITextField {
        let textField = UITextField()
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}
