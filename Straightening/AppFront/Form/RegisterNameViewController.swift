//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

class RegisterNameViewController: UIViewController, SetupView {
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(textFieldTarget), for: .editingChanged)
        textField.attributedPlaceholder = NSAttributedString(string: "Nome Completo",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        return textField
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField])
        stackView.setUnderlineBorder()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var action = UIAction {_ in
        self.navigationController?.pushViewController(RegisterPhoneViewController(),
                                                      animated: true)
    }
    lazy var button = Create.baseButton("ENTRAR", backgroundColor: Assets.Colors.weakWhite)
    override func loadView() {
        super.loadView()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.lightGreen?.cgColor as Any,
                           Assets.Colors.darkGreen?.cgColor as Any]
        view.layer.insertSublayer(gradient, at: 0)
        setupView()
        setupConstraints()
        button.addAction(action, for: .touchUpInside)
    }
    func setupView() {
        view.addSubviews([stackView, button])
    }
    func setupConstraints() {
        view.addConstraints([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.heightAnchor.constraint(equalToConstant: view.frame.height*0.05)
        ])
    }
    @objc func textFieldTarget(_ sender: UITextField) {
        print(sender.text)
    }
}
