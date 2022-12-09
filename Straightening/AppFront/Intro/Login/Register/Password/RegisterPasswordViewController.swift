//
//  RegisterPasswordViewController.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation
import UIKit

final class RegisterPasswordViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        configure()
    }
    private func configure() {
        title = "Senha"
        setupText()
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
// This function sets parameters for the text property
    func setupText() {
        setTextFieldPlaceholder("Senha")
        registerView.textField.becomeFirstResponder()
        registerView.textField.addTarget(self, action: #selector(tapPasswordTextfield), for: .editingChanged)
    }
// This function validates if the password matches the regex
    @objc func tapPasswordTextfield(_ sender: UITextField) {
        guard let value = sender.text else {return}
        registerView.button.performSelection(condition: registerView.textField.isValidPassword(value))
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.password = registerView.textField.text
        self.navigationController?.navigate(to: RegisterBirthDateViewController(registerViewModel))
    }
}
