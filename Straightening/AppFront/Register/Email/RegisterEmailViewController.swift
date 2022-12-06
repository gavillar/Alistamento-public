//
//  RegisterEmailViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterEmailViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Email"
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        setupText()
    }
// This function sets parameters for the text property
    func setupText() {
        setTextFieldPlaceholder("Email")
        registerView.textField.becomeFirstResponder()
        registerView.textField.autocapitalizationType = .none
        registerView.textField.addTarget(self, action: #selector(tapEmailTextfield), for: .editingChanged)
        registerView.textField.addTarget(self, action: #selector(textLowercased), for: .editingChanged)
    }
// This function restricts that capital letters can be entered in the text field
    @objc func textLowercased(_ sender: UITextField) {
        guard sender.text != nil else {return}
        sender.text? = sender.text?.lowercased() ?? ""
    }
// This function validates if the email matches the regex
    @objc func tapEmailTextfield(_ sender: UITextField) {
        guard let text = sender.text else {return}
        registerView.button.performSelection(
            condition: registerView.textField.isValidEmail(text)
        )
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.email = registerView.textField.text
        Task {
            if await !registerViewModel.verifyIfEmailExists() {
                self.navigationController?.navigate(
                    to: RegisterPasswordViewController(self.registerViewModel)
                )
            } else {
                let alert = Create.alert(
                    title: "Este email j[a existe",
                    message: "Tente com algum outro email."
                )
                present(alert, animated: true)
            }
        }
    }
}
