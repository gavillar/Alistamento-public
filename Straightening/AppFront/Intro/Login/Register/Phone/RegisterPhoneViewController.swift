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
        configure()
    }
    private func configure() {
        title = "Telefone"
        setTextFieldPlaceholder("Telefone")
        registerView.textField.becomeFirstResponder()
        registerView.textField.formatMask = "(##)#####-####"
        registerView.textField.addTarget(self, action: #selector(tapPhoneTextField), for: .editingChanged)
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    @objc func tapPhoneTextField(_ sender: UITextField) {
        guard let count = sender.text?.count else {return}
        registerView.button.performSelection(condition: count > 10)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.phone = registerView.textField.text
        self.navigationController?.navigate(to: RegisterEmailViewController(registerViewModel))
    }
}
