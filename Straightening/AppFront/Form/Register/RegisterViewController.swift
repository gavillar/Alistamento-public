//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit

class RegisterViewController: UIViewController, SetupView {
// MARK: - Variables
    lazy var baseView: (view: UIView, stack: UIStackView) = {
        let stackView = UIStackView(arrangedSubviews: [textField])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.setUnderlineBorder()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.85).isActive = true
        stackView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        return (view: baseView, stack: stackView)
    }()
    lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    lazy var textFieldPicker: PickerViewMinisteryTextField = {
        return PickerViewMinisteryTextField()
    }()
    lazy var button = Create.baseButton("ENTRAR", titleColor: Assets.Colors.brown,
                                        backgroundColor: Assets.Colors.weakWhite)
// MARK: - override functions
    override func loadView() {
        super.loadView()
        view.defaultBackground()
        setupView()
        setupConstraints()
        hideKeyboardWhenTappedAround()
    }
    
// MARK: - Setup
    func setupView() {
        view.addSubviews([baseView.view, button])
    }
    func setupConstraints() {
        view.addConstraints([
            baseView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseView.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            baseView.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            baseView.view.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.heightAnchor.constraint(equalToConstant: view.frame.height*0.05)
        ])
    }
}

