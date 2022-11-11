//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, SetupView {
    private let logo: (stack: UIStackView, label: UILabel) = {
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
    private lazy var forgotPasswordButton = Create.baseButton("Esqueci minha senha")
    private lazy var signInButton = Create.baseButton("CRIAR UMA CONTA",
                                                      backgroundColor: Assets.Colors.blue)
    private lazy var logInButton = Create.baseButton("ENTRAR",
                                                     backgroundColor: Assets.Colors.brown)
    private lazy var constraints = [
        logo.stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                        constant: 100),
        logo.stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                            constant: 30),
        logo.stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
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
        forgotPasswordButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        forgotPasswordButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        forgotPasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                     constant: -view.frame.height*0.1),
        forgotPasswordButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
        signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                             constant: -view.frame.height*0.05),
        signInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        logInButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
        logInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    func setupView() {
        view.backgroundColor = Assets.Colors.green
        view.addSubviews([logo.stack,
                          welcomeLabel,
                          email.stackView,
                          password.stackView,
                          forgotPasswordButton,
                          logInButton,
                          signInButton])
    }
    func setupConstraints() {
        view.addConstraints(constraints)
    }
}
