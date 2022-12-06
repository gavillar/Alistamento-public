//
//  LoginModalView.swift
//  Straightening
//
//  Created by user220831 on 12/2/22.
//

import Foundation
import UIKit

final class LoginErrorView: UIView {
// MARK: - variables
    lazy var failureLabel = Create.label("Email ou Senha Incorretos",
                                         font: .boldSystemFont(ofSize: 20))
    lazy var instructionLabel = Create.label("Confira se seu Email e sua senha estão corretos.",
                                             font: .boldSystemFont(ofSize: 20))
    lazy var stackView: UIStackView = {
        let stack = Create.stack()
        stack.addArrangedSubviews([failureLabel, instructionLabel])
       return stack
    }()
    lazy var tryAgainButton = Create.baseButton("Tentar Novamente")
    lazy var forgotPasswordButton = Create.baseButton("Esqueci minha senha")
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
        setupConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        addSubviews([stackView, tryAgainButton, forgotPasswordButton])
    }
    func setupConstrains() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                         constant: -40),
            tryAgainButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tryAgainButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tryAgainButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,
                                                 constant: 0)
        ])
    }
}
