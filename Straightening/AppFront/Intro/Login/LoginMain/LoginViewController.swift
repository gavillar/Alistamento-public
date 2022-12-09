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
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        view.layer.addGradientBackground(frame: CGRect(origin: .zero, size: size))
    }
    override func loadView() {
        super.loadView()
        configure()
    }
    func configure() {
        view = loginView
        setupTargets()
        signatureDelegates()
        configureNotificationsObserves()
    }
    func signatureDelegates() {
        loginviewmodel.authenticationdelegate = self
        loginviewmodel.authenticationFailDelegate = self
    }
// MARK: - setup
    private func setupTargets() {
        loginView.forgotPasswordButton.addTarget(nil, action: #selector(hendleForgotPassword), for: .touchUpInside)
        loginView.signInButton.addTarget(nil, action: #selector(hendleSignIn), for: .touchUpInside)
        loginView.logInButton.addTarget(self, action: #selector(hendleLogIn), for: .touchUpInside)
    }
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
        navigationController?.navigate(to: ForgotPasswordViewController())
    }
    @objc func hendleSignIn() {
        navigationController?.navigate(to: RegisterNameViewController())
    }
    @objc func hendleLogIn() {
        loginviewmodel.performLogin()
    }
}

extension LoginViewController: UpdateFormViewModel {
    func updateForm() {
        loginView.logInButton.performSelection(condition: loginviewmodel.formatIsValid)
    }
}

extension LoginViewController: AuthenticationLoginFail {
    func showView() {
        let alert = Create.alert(
            title: "Email ou Senha Incorretos",
            message: "Confira se seu Email e sua senha estão corretos."
        )
        present(alert, animated: true)
    }
}

extension LoginViewController: AuthenticationDelegate {
    func nextView() {
        navigationController?.navigate(to: HomeViewController())
    }
    func reloadView() {
        loginView.emailTextField.text = nil
        loginView.passwordTextField.text = nil
    }
}
