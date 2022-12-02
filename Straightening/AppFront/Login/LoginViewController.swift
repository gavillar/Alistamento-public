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
    lazy var emailStackView: UIStackView = {
        let margins = view.frame.height*0.02
        let emailStackView = Create.stack(
            layoutMargins: UIEdgeInsets(top: margins, left: 0,
                                        bottom: margins, right: 0),
            arrangedSubviews: [emailTextField])
        return emailStackView
    }()
    lazy var passwordTextField: UITextField = {
        let passwordTextField = Create.textField(placeholder: "Senha")
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    lazy var passwordStackView: UIStackView = {
        let margins = view.frame.height*0.02
        let passwordStackView = Create.stack(
            layoutMargins: UIEdgeInsets(top: margins, left: 0,
                                        bottom: margins, right: 0),
            arrangedSubviews: [passwordTextField]
        )
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
    lazy var logInButton: UIButton =  {
        let button = Create.baseButton("ENTRAR", titleColor: nil, backgroundColor: nil)
        button.addTarget(self, action: #selector(hendleSingUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
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
        setupView()
        setupConstraints()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationsObserves()
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
    func configureNotificationsObserves() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textLowercased), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    @objc func textLowercased(_ sender: UITextField) {
            guard sender.text != nil else {return}
            sender.text? = sender.text?.lowercased() ?? ""
        }
    @objc func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            loginviewmodel.email = sender.text
        } else {
            loginviewmodel.password = sender.text
        }
            updateForm()
    }
    @objc func hendleSingUp() {
        loginviewmodel.performLogin()
        nextView()
    }
}

extension LoginViewController: UpdateFormViewModel {
    func updateForm() {
        logInButton.backgroundColor = loginviewmodel.backgroundCollorButton
        logInButton.setTitleColor(loginviewmodel.titleColorButton, for: .normal)
        logInButton.isEnabled = loginviewmodel.formatIsValid
    }
}

extension LoginViewController: AuthenticationDelegate {
    func nextView() {
        navigationController?.navigate(to: HomeViewController())
    }
    
    
}
