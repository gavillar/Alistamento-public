//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import UIKit

class LoginViewController: UIViewController {
// MARK: - variables
    var loginviewmodel = LoginViewModel()
    private lazy var loginView = LoginView(frame: view.frame)
// MARK: - overrides
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        configureNotificationsObserves()
        view = loginView
        loginView.forgotPasswordButton.addTarget(nil, action: #selector(hendleForgotPassword), for: .touchUpInside)
        loginView.signInButton.addTarget(nil, action: #selector(hendleSignIn), for: .touchUpInside)
        loginView.logInButton.addTarget(self, action: #selector(hendleLogIn), for: .touchUpInside)
    }
// MARK: - setup
    func configureNotificationsObserves() {
        loginView.emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        loginView.emailTextField.addTarget(self, action: #selector(textLowercased), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    @objc func textLowercased(_ sender: UITextField) {
            guard sender.text != nil else {return}
            sender.text? = sender.text?.lowercased() ?? ""
        }
    @objc func textDidChange(_ sender: UITextField) {
        if sender == loginView.emailTextField {
            loginviewmodel.email = sender.text
        } else {
            loginviewmodel.password = sender.text
        }
            updateForm()
    }
    @objc func hendleForgotPassword() {
        navigationController?.navigate(to: BooksViewController())
    }
    @objc func hendleSignIn() {
        navigationController?.navigate(to: RegisterNameViewController())
    }
    @objc func hendleLogIn() {
        loginviewmodel.performLogin()
        nextView()
    }
}

extension LoginViewController: UpdateFormViewModel {
    func updateForm() {
        loginView.logInButton.backgroundColor = loginviewmodel.backgroundCollorButton
        loginView.logInButton.setTitleColor(loginviewmodel.titleColorButton, for: .normal)
        loginView.logInButton.isEnabled = loginviewmodel.formatIsValid
    }
}

extension LoginViewController: AuthenticationDelegate {
    func nextView() {
        navigationController?.navigate(to: HomeViewController())
    }
}
