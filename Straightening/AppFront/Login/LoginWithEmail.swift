//
//  LoginSetup.swift
//  Straightening
//
//  Created by user220831 on 11/30/22.
//
import Foundation
import UIKit
import Firebase

class LoginWithEmail: LoginViewController {
    override func loadView() {
        super.loadView()
        setupEmailText()
        setupPasswordText()
        logInButton.isUserInteractionEnabled = false
        logInButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }
    @objc func tapLoginButton() {
        loginviewmodel.performLogin()
        self.navigationController?.navigate(to: HomeViewController())
        email.textField.text = nil
        password.textField.text = nil
    }
    func setupEmailText() {
        email.textField.addTarget(self, action: #selector(tapLoginEmailTextfield), for: .editingChanged)
        email.textField.addTarget(self, action: #selector(textLowercased), for: .editingChanged)
    }
    func setupPasswordText() {
        password.textField.addTarget(self, action: #selector(tapLoginPasswordTextfield), for: .editingChanged)
    }
// This function restricts that capital letters can be entered in the text field
    @objc func textLowercased(_ sender: UITextField) {
        guard sender.text != nil else {return}
        sender.text? = sender.text?.lowercased() ?? ""
    }
// This function validates if the email matches the regex
    @objc func tapLoginEmailTextfield(_ sender: UITextField) {
        guard let value = sender.text else {return}
        print(value)
        if email.textField.isValidEmail(value) {
            catchEmailText()
        }
    }
// This function captures the text field to send to the viewmodel
    func catchEmailText() {
        guard let email = email.textField.text else {return}
        UserDefaults.standard.set(email, forKey: "loginEmail")
   }
// This function validates if the email matches the regex
    @objc func tapLoginPasswordTextfield(_ sender: UITextField) {
        guard let value = sender.text else {return}
        if password.textField.isValidPassword(value) {
            catchPasswordText()
            logInButton.isUserInteractionEnabled = true
        } else {
            logInButton.isUserInteractionEnabled = false
        }
    }
// This function captures the text field to send to the viewmodel
    func catchPasswordText() {
        guard let password = password.textField.text else {return}
        UserDefaults.standard.set(password, forKey: "loginPassword")
   }
}
