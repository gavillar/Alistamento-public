//
//  uiViewController+HiddenKeyboard.swift
//  Straightening
//
//  Created by user220831 on 11/16/22.
//

import UIKit

// Put this piece of code anywhere you like
extension UIView {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        endEditing(true)
    }
}
