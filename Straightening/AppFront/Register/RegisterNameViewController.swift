//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterNameViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Nome Completo"
        setTextFieldPlaceholder("Nome Completo")
        textField.becomeFirstResponder()
        textField.addTarget(self, action: #selector(tapNameTextField), for: .editingChanged)
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    @objc func tapNameTextField(_ sender: UITextField) {
        guard let count = sender.text?.count else {return}
        button.performSelection(condition: count > 6)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.name = textField.text
        self.navigationController?.navigate(to: RegisterPhoneViewController(registerViewModel))
    }
}
