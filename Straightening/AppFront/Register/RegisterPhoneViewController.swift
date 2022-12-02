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
        setTextFieldPlaceholder("Telefone")
        textField.becomeFirstResponder()
        textField.formatMask = "(##)#####-####"
        textField.addTarget(self, action: #selector(tapPhoneTextField), for: .editingChanged)
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    @objc func tapPhoneTextField(_ sender: UITextField) {
        guard let count = sender.text?.count else {return}
        button.performSelection(condition: count > 10)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.phone = textField.text
        self.navigationController?.navigate(to: RegisterEmailViewController(registerViewModel))
    }
}
