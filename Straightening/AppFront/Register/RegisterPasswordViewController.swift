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
        title = "Senha"
        setupText()
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        
    }
    //This function sets parameters for the text property
    func setupText() {
        setTextFieldPlaceholder("Senha")
        textField.becomeFirstResponder()
        textField.addTarget(self, action: #selector(tapPasswordTextfield), for: .editingChanged)
    }
    //This function validates if the password matches the regex
    @objc func tapPasswordTextfield(_ sender: UITextField) {
        guard let value = sender.text else {return}
        if button.performSelection(condition: textField.isValidPassword(value)) {
            catchPasswordText()
        }
    }
    //This function captures the text field to send to the viewmodel
    func catchPasswordText() {
       textField.bind { text in
           self.registerViewModel.password = text
           print(text)
       }
   }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.password = textField.text
        self.navigationController?.navigate(to: RegisterBirthDateViewController(registerViewModel))
    }
}
