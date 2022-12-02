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
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        setupText()
    }
// This function sets parameters for the text property
    func setupText() {
        setTextFieldPlaceholder("Email")
        textField.becomeFirstResponder()
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(tapEmailTextfield), for: .editingChanged)
        textField.addTarget(self, action: #selector(textLowercased), for: .editingChanged)
    }
// This function restricts that capital letters can be entered in the text field
    @objc func textLowercased(_ sender: UITextField) {
        guard sender.text != nil else {return}
        sender.text? = sender.text?.lowercased() ?? ""
    }
// This function validates if the email matches the regex
    @objc func tapEmailTextfield(_ sender: UITextField) {
        guard let value = sender.text else {return}
        if registerViewModel.changeButton(condition: textField.isValidEmail(value)) {
            catchEmailText()
        }
    }
// This function captures the text field to send to the viewmodel
    func catchEmailText() {
       textField.bind {text in
           self.registerViewModel.email = text
       }
    }

// MARK: - objc functions
    @objc func buttonTarget() {
        print("tap email")
        registerViewModel.userToRegister.email = textField.text
        self.navigationController?.navigate(to: RegisterPasswordViewController(registerViewModel))
    }
}
