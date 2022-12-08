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
        logoLabel.textColor = Assets.Colors.whiteBlack
        let logoStack = UIStackView(arrangedSubviews: [logoLabel])
        logoStack.translatesAutoresizingMaskIntoConstraints = false
        return logoStack
    }()
    private lazy var welcomeLabel: UILabel = {
        let label = Create.label("Bem Vindo")
        label.textColor = Assets.Colors.whiteBlack
        return label
    }()
    lazy var emailTextField = {
        let emailTextField = Create.textField(placeholder: "Email")
        emailTextField.becomeFirstResponder()
        emailTextField.keyboardType = .namePhonePad
        return emailTextField
    }()
    private lazy var emailStackView: UIStackView = {
        let margins = frame.height*0.02
        let emailStackView = Create.stack(
            layoutMargins: UIEdgeInsets(top: margins, left: 0,
                                        bottom: margins, right: 0),
            arrangedSubviews: [emailTextField]
        )
        emailStackView.addUnderline(frame.height*0.015)
        return emailStackView
    }()
    lazy var passwordTextField: UITextField = {
        let passwordTextField = Create.textField(placeholder: "Senha")
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    private lazy var passwordStackView: UIStackView = {
        let margins = frame.height*0.02
        let passwordStackView = Create.stack(
            layoutMargins: UIEdgeInsets(top: margins, left: 0,
                                        bottom: margins, right: 0),
            arrangedSubviews: [passwordTextField]
        )
        passwordStackView.addUnderline(frame.height*0.005)
        return passwordStackView
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let stackView = scrollView.turnIntoAList(of: [logoStack,
                                                      welcomeLabel,
                                                      emailStackView,
                                                      passwordStackView])
        stackView.isLayoutMarginsRelativeArrangement = true
        let verticalMargins = frame.height*0.05
        let horizontalMargins = frame.height*0.04
        stackView.layoutMargins = UIEdgeInsets(top: verticalMargins, left: horizontalMargins,
                                               bottom: verticalMargins*2, right: horizontalMargins)
        stackView.spacing = 50
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
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - funcs
    func setupView() {
        addSubviews([scrollView,
                     forgotPasswordButton,
                     signInButton,
                     logInButton])
    }
    func setupConstraints() {
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
