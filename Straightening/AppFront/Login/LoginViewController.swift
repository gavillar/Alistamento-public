//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import UIKit

class LoginViewController: UIViewController, SetupView {
// MARK: - variables
    let loginviewmodel = LoginViewModel()
    private lazy var logo: (stack: UIStackView, label: UILabel) = {
        let label = Create.label("Alistamento")
        label.textColor = Assets.Colors.whiteBlack
        let stack = UIStackView(arrangedSubviews: [label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return (stack: stack, label: label)
    }()
    private lazy var welcomeLabel: UILabel = {
        let label = Create.label("Bem Vindo")
        label.textColor = Assets.Colors.whiteBlack
        return label
    }()
    lazy var email: (stackView: UIStackView, textField: UITextField) = {
        let emailTextField = Create.textField(placeholder: "Email")
        emailTextField.becomeFirstResponder()
        emailTextField.keyboardType = .namePhonePad
        let margins = view.frame.height*0.02
        let stackView = Create.stack(
            layoutMargins: UIEdgeInsets(top: margins, left: 0,
                                        bottom: margins, right: 0),
            arrangedSubviews: [emailTextField])
        return (stackView: stackView,
                textField: emailTextField)
    }()
    lazy var password: (stackView: UIStackView, textField: UITextField) = {
        let passwordTextField = Create.textField(placeholder: "Senha")
        passwordTextField.isSecureTextEntry = true
        let margins = view.frame.height*0.02
        let stackView = Create.stack(
            layoutMargins: UIEdgeInsets(top: margins, left: 0,
                                        bottom: margins, right: 0),
            arrangedSubviews: [passwordTextField])
    
        return (stackView: stackView,
                textField: passwordTextField)
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let stackView = scrollView.turnIntoAList(of: [logo.stack,
                                                      welcomeLabel,
                                                      email.stackView,
                                                      password.stackView])
        stackView.isLayoutMarginsRelativeArrangement = true
        let verticalMargins = view.frame.height*0.05
        let horizontalMargins = view.frame.height*0.04
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargins, left: horizontalMargins,
                                               bottom: verticalMargins*2, right: horizontalMargins)
        stackView.spacing = 50
        return scrollView
    }()
    private lazy var forgotPasswordButton = Create.baseButton("Esqueci minha senha",
                                                              titleColor: Assets.Colors.whiteBlack,
                                                              backgroundColor: nil) {_ in
        self.navigationController?.navigate(to: BooksViewController())
    }
    private lazy var signInButton = Create.baseButton("CRIAR UMA CONTA") {_ in
        self.navigationController?.navigate(to: RegisterNameViewController())
    }
    lazy var logInButton: UIButton = Create.baseButton("ENTRAR")
    private lazy var constraints = [
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: logInButton.topAnchor),
        forgotPasswordButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        forgotPasswordButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        forgotPasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                     constant: -view.frame.height*0.1),
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: view.frame.height*0.05),
        signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                             constant: -view.frame.height*0.05),
        signInButton.heightAnchor.constraint(equalToConstant: view.frame.height*0.05),
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        logInButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
        logInButton.heightAnchor.constraint(equalToConstant: view.frame.height*0.05)
    ]
// MARK: - overrides
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - setup
    func setupView() {
        view.addSubviews([scrollView,
                          forgotPasswordButton,
                          signInButton,
                          logInButton])
    }
    func setupConstraints() {
        view.addConstraints(constraints)
    }
    
}
