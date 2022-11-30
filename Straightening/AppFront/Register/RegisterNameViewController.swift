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
        text.setPlaceholder("Nome Completo")
        text.field.becomeFirstResponder()
        text.field.addTarget(self, action: #selector(tapNameTextField), for: .editingChanged)
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    @objc func tapNameTextField(_ sender: UITextField) {
        guard let count = sender.text?.count else {return}
        registerViewModel.changeButton(condition: count > 6)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.name = text.field.text
        self.navigationController?.navigate(to: RegisterPhoneViewController(registerViewModel))
    }
}
