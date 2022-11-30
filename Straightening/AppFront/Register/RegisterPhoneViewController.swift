//
//  RegisterPhoneViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterPhoneViewController: RegisterViewController, UITextFieldDelegate {
    override func loadView() {
        super.loadView()
        title = "Telefone"
        text.setPlaceholder("Telefone")
        text.field.becomeFirstResponder()
        text.field.formatMask = "(##)#####-####"
        text.field.addTarget(self, action: #selector(tapPhoneTextField), for: .editingChanged)
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
    @objc func tapPhoneTextField(_ sender: UITextField) {
        guard let count = sender.text?.count else {return}
        registerviewmodel.changeButton(condition: count > 10)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterEmailViewController())
    }
}
