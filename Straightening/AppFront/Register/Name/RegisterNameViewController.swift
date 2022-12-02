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
        setupTargets()
    }
    private func setupTargets() {
        registerView.textField.becomeFirstResponder()
        registerView.textField.addTarget(self, action: #selector(tapNameTextField), for: .editingChanged)
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    @objc func tapNameTextField(_ sender: UITextField) {
        guard let count = sender.text?.count else {return}
        registerView.button.performSelection(condition: count > 6)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.name = registerView.textField.text
        self.navigationController?.navigate(to: RegisterPhoneViewController(registerViewModel))
    }
}
