//
//  RegisterView.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

class RegisterView: UIView {
// MARK: - variables
    private let baseView: UIView = {
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        return baseView
    }()
    lazy var baseStackView: UIStackView = {
        let baseStackView = Create.stack(frame.height*0.015, arrangedSubviews: [textField])
        baseStackView.addUnderline(frame.height*0.015)
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        return baseStackView
    }()
    lazy var textField = BindingTextField()
    lazy var button: BaseButton = {
        let button = BaseButton("ENTRAR", titleColor: Assets.Colors.brown)
        return button
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
// MARK: - setup
    func setupView() {
        baseView.addSubview(baseStackView)
        addSubviews([baseView, button])
    }
    func setupConstraints() {
        addConstraints([
            baseStackView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.85),
            baseStackView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            baseStackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            baseView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            button.heightAnchor.constraint(equalToConstant: frame.height*0.05)
        ])
    }
}
