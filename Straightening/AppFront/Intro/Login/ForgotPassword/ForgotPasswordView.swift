//
//  LoginModalView.swift
//  Straightening
//
//  Created by user220831 on 12/2/22.
//

import UIKit

final class ForgotPasswordView: UIView {
// MARK: - variables
    lazy var failureLabel: UILabel = {
        let failureLabel = Create.labelTitle("Esqueci a senha")
        failureLabel.textAlignment = .center
        return failureLabel
    }()
    lazy var instructionLabel = Create.label(
        "Digite seu Email para enviarmos uma solicitação de mudança de senha.",
        font: UIFont.systemFont(ofSize: 15)
    )
    lazy var forgotPasswordTextField = Create.textField()
    lazy var stackView: UIStackView = {
        let stackView = Create.stack(arrangedSubviews: [failureLabel,
                                                        instructionLabel])
        stackView.distribution = .fillProportionally
       return stackView
    }()
    lazy var sendButton = Create.baseButton("ENVIAR")
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        addSubviews([stackView, sendButton, forgotPasswordTextField])
    }
    private func constrain() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: frame.width*0.1),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -frame.width*0.1),
            stackView.bottomAnchor.constraint(equalTo: centerYAnchor),
            forgotPasswordTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            forgotPasswordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            forgotPasswordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            sendButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: frame.height*0.05)
        ])
    }
}
