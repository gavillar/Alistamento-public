//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit

class RegisterViewController: UIViewController {
// MARK: - Variables
    var registerViewModel: RegisterViewModel
    lazy var datePicker = DatePicker()
    let baseView: UIView = {
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        return baseView
    }()
    lazy var baseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.setUnderlineBorderWhite()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var setTextFieldPlaceholder = {(placeholder: String) in
        self.textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                  attributes: [
                                                                    NSAttributedString.Key.foregroundColor:
                                                                        UIColor.white
                                                                  ])
    }
    lazy var textField = BindingTextField()
    lazy var textFieldPicker = PickerViewCustom()
    lazy var button: UIButton = {
        let button = Create.baseButton("ENTRAR", titleColor: Assets.Colors.brown)
        return button
    }()
// MARK: - init
    init(_ registerViewModel: RegisterViewModel = RegisterViewModel()) {
        self.registerViewModel = registerViewModel
        print(self.registerViewModel.userToRegister)
        super.init(nibName: nil, bundle: nil)
        registerViewModel.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - override functions
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        setupView()
        setupConstraints()
        freezeButton()
        navigationController?.navigationBar.hideKeyboardWhenTappedAround()
        view.hideKeyboardWhenTappedAround()
        baseStackView.addArrangedSubview(textField)
    }
// MARK: - Setup
    func setupView() {
        baseView.addSubview(baseStackView)
        view.addSubviews([baseView, button])
    }
    func setupConstraints() {
        view.addConstraints([
            baseStackView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.85),
            baseStackView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            baseStackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            baseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.heightAnchor.constraint(equalToConstant: view.frame.height*0.05)
        ])
    }
    func setupPickerView(_ title: String, options: [String]) {
        textFieldPicker.attributedPlaceholder = NSAttributedString(string: title,
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        textFieldPicker.picker = options
        textFieldPicker.displayNameHandler = {item in
            return (item as? String) ?? ""
        }
        textFieldPicker.itemSelectionHandler = { index, item in
            print("\(index), \(item as? String)")
        }
        baseStackView.addArrangedSubview(textFieldPicker)
    }
}

extension RegisterViewController: DatePickerDelegate {
    func datePicker(_ toolBar: UIToolbar) {
        textField.inputAccessoryView = toolBar
        textField.inputView = datePicker
    }
    func doneButtonTarget() {
        view.dismissKeyboard()
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func freezeButton() {
        button.alpha = 0.5
        button.isUserInteractionEnabled = false
    }
    func unFreezeButton() {
        button.alpha = 1
        button.isUserInteractionEnabled = true
    }
}
