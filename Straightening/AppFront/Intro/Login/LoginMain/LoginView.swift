//
//  LoginView.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

class LoginView: UIView {
// MARK: - variables
    private lazy var logoStack: UIStackView = {
        let logoLabel = Create.label("Alistamento")
        let logoStack = UIStackView(arrangedSubviews: [logoLabel])
        logoStack.translatesAutoresizingMaskIntoConstraints = false
        return logoStack
    }()
    private lazy var welcomeLabel: UILabel = {
        let label = Create.label("Bem Vindo")
        return label
    }()
    lazy var emailTextField = {
        let emailTextField = Create.textField(placeholder: "Email")
        emailTextField.becomeFirstResponder()
        emailTextField.keyboardType = .namePhonePad
        return emailTextField
    }()
    lazy var passwordTextField: UITextField = {
        let passwordTextField = Create.textField(placeholder: "Senha")
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let stackView = scrollView.turnIntoAList(of: [logoStack,
                                                      welcomeLabel,
                                                      emailTextField,
                                                      passwordTextField])
        stackView.isLayoutMarginsRelativeArrangement = true
        let margins = frame.height*0.04
        stackView.layoutMargins = UIEdgeInsets(top: margins, left: margins,
                                               bottom: margins*4, right: margins)
        stackView.spacing = frame.height*0.07
        return scrollView
    }()
    lazy var forgotPasswordButton = Create.baseButton("Esqueci minha senha",
                                                              titleColor: Assets.Colors.whiteBlack,
                                                              backgroundColor: nil)
    lazy var signInButton = Create.baseButton("CRIAR UMA CONTA")
    lazy var logInButton: BaseButton = {
        let logInButton = BaseButton("ENTRAR")
        logInButton.freezeButton()
        return logInButton
    }()
// MARK: - overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - funcs
    func configure() {
        addSubviews([scrollView,
                     forgotPasswordButton,
                     signInButton,
                     logInButton])
    }
    func constrain() {
        addConstraints([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: logInButton.topAnchor),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                         constant: -frame.height*0.1),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: frame.height*0.05),
            signInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                 constant: -frame.height*0.05),
            signInButton.heightAnchor.constraint(equalToConstant: frame.height*0.05),
            logInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: frame.height*0.05)
        ])
    }
}
