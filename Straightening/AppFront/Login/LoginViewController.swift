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
    private lazy var forgotPasswordButton = Create.button("Esqueci minha senha", titleColor: .red)
    private lazy var logIn: (stackView: UIStackView, button: UIButton) = {
        let loginButton = Create.button("ENTRAR", titleColor: .yellow)
        return (stackView: Create.stack(backgroundColor: .green, arrangedSubviews: [loginButton]),
                button: loginButton)
    }()
    private lazy var signInButton = Create.button("CRIAR UMA CONTA ")
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor, UIColor.white.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubviews([logo.stack,
                          welcomeLabel,
                          email.stackView,
                          password.stackView,
                          forgotPasswordButton,
                          logIn.stackView,
                          signInButton])
    }
    func setupConstraints() {
            view.addConstraints([
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
                forgotPasswordButton.topAnchor.constraint(equalTo: password.stackView.bottomAnchor,
                                                          constant: 10),
                forgotPasswordButton.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
                forgotPasswordButton.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
                logIn.stackView.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,
                                                constant: 20),
                logIn.stackView.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
                logIn.stackView.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor),
                signInButton.topAnchor.constraint(equalTo: logIn.stackView.bottomAnchor,
                                                  constant: 20),
                signInButton.leadingAnchor.constraint(equalTo: logo.stack.leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: logo.stack.trailingAnchor)
            ])
    }
}
