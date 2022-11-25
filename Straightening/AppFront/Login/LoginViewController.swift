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
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let stackView = scrollView.turnIntoAList(of: [logo.stack,
                                                      welcomeLabel,
                                                      email.stackView,
                                                      password.stackView])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20,
                                               left: 20,
                                               bottom: 20,
                                               right: 20)
        stackView.spacing = 50
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
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.defaultBackground()
    }
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - functions
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
