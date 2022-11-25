//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import UIKit

class LoginViewController: UIViewController, SetupView {
// MARK: - variables
    private lazy var logo: (stack: UIStackView, label: UILabel) = {
        let label = Create.label("Alistamento")
        let stack = UIStackView(arrangedSubviews: [label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return (stack: stack, label: label)
    }()
    private lazy var welcomeLabel = Create.label("Bem Vindo")
    private lazy var email: (stackView: UIStackView, textField: UITextField) = {
        let emailTextField = Create.textField()
        emailTextField.keyboardType = .namePhonePad
        let line = UIView()
        line.backgroundColor = .white
        let stackView = Create.stack(arrangedSubviews: [emailTextField, line])
        line.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return (stackView: stackView,
                textField: emailTextField)
    }()
    private lazy var password: (stackView: UIStackView, textField: UITextField) = {
        let passwordTextField = Create.textField()
        let line = UIView()
        line.backgroundColor = .white
        let stackView = Create.stack(arrangedSubviews: [passwordTextField, line])
        line.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return (stackView: stackView,
                textField: passwordTextField)
    }()
    private lazy var scrollView: UIScrollView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubviews([view,
                                logo.stack,
                                welcomeLabel,
                                email.stackView,
                                password.stackView])
        scrollView.addConstraints([
            view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            logo.stack.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 60*self.view.frame.height/850),
            logo.stack.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 30*self.view.frame.width/400),
            logo.stack.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -30*self.view.frame.width/400),
            welcomeLabel.topAnchor.constraint(equalTo: logo.stack.bottomAnchor,
                                              constant: 100*self.view.frame.height/850),
            welcomeLabel.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
            email.stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,
                                                 constant: 90*self.view.frame.height/850),
            email.stackView.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
            email.stackView.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
            password.stackView.topAnchor.constraint(equalTo: email.stackView.bottomAnchor,
                                                    constant: 60*self.view.frame.height/850),
            password.stackView.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
            password.stackView.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
            password.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                       constant: -20*self.view.frame.height/850)
        ])
        return scrollView
    }()
    private lazy var forgotPasswordButton = Create.baseButton("Esqueci minha senha",
                                                              titleColor: .red) {_ in
        self.navigationController?.navigate(to: BooksViewController())
    }
    private lazy var signInButton = Create.baseButton("CRIAR UMA CONTA",
                                                      backgroundColor: Assets.Colors.weakWhite) {_ in
        self.navigationController?.navigate(to: RegisterNameViewController())
    }
    private lazy var logInButton = Create.baseButton("ENTRAR",
                                                     backgroundColor: Assets.Colors.weakWhite) {_ in
        self.navigationController?.navigate(to: FormViewController())
    }
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
// MARK: - override functions
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - functions
    func setupView() {
        view.defaultBackground()
        view.addSubviews([scrollView,
                          forgotPasswordButton,
                          signInButton,
                          logInButton])
    }
    func setupConstraints() {
        view.addConstraints(constraints)
    }
}
