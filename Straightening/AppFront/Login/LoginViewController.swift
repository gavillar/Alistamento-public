//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import UIKit

class LoginViewController: UIViewController, SetupView {
// MARK: - Variables
    private lazy var logo: (stack: UIStackView, label: UILabel) = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        let label = Create.label("Alistamento")
        let stack = UIStackView(arrangedSubviews: [imageView, label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        return (stack: stack, label: label)
    }()
    private lazy var welcomeLabel = Create.label("Bem Vindo")
    private lazy var email: (stackView: UIStackView, textField: UITextField) = {
        let emailTextField = Create.textField()
        return (stackView: Create.stack(backgroundColor: .white, arrangedSubviews: [emailTextField]),
                textField: emailTextField)
    }()
    private lazy var password: (stackView: UIStackView, textField: UITextField) = {
        let passwordTextField = Create.textField()
        return (stackView: Create.stack(backgroundColor: .white, arrangedSubviews: [passwordTextField]),
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
                                            constant: 100),
            logo.stack.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 30),
            logo.stack.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -30),
            welcomeLabel.topAnchor.constraint(equalTo: logo.stack.bottomAnchor,
                                              constant: 100),
            welcomeLabel.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
            email.stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,
                                                     constant: 70),
            email.stackView.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
            email.stackView.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
            password.stackView.topAnchor.constraint(equalTo: email.stackView.bottomAnchor,
                                                    constant: 20),
            password.stackView.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
            password.stackView.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
            password.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return scrollView
    }()
    private lazy var forgotPasswordButton = Create.baseButton("Esqueci minha senha",
                                                              titleColor: .red)
    private lazy var signInButton = Create.baseButton("CRIAR UMA CONTA",
                                                      backgroundColor: Assets.Colors.blue)
    private lazy var logInButton = Create.baseButton("ENTRAR",
                                                     titleColor: Assets.Colors.brown,
                                                     backgroundColor: Assets.Colors.lightGreen)
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
// MARK: - Override
    override func loadView() {
        super.loadView()
        setupView()
        setupConstraints()
    }
// MARK: - Functions
    func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.lightGreen?.cgColor as Any]
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubviews([scrollView,
                          forgotPasswordButton,
                          signInButton,
                          logInButton])
    }
    func setupConstraints() {
        view.addConstraints(constraints)
    }
}
