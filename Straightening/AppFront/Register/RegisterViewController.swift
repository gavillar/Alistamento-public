//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit

class RegisterViewController: UIViewController, SetupView {
// MARK: - Variables
    let registerviewmodel = RegisterViewModel()
    lazy var datePicker = DatePicker()
    lazy var base: (view: UIView, stack: UIStackView) = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.setUnderlineBorderWhite()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.85).isActive = true
        stackView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        return (view: baseView, stack: stackView)
    }()
    lazy var text: (field: BindingTextField, setPlaceholder: (String) -> Void) = {
        let textField = BindingTextField()
        base.stack.addArrangedSubview(textField)
        let setPlaceholder = {(placeholder: String) in
            textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                 attributes: [
                                                                    NSAttributedString.Key.foregroundColor:
                                                                        UIColor.white
                                                                 ])
        }
        return (field: textField, setPlaceholder: setPlaceholder)
    }()

    lazy var button: UIButton = {
        let button = Create.baseButton("ENTRAR", titleColor: Assets.Colors.brown)
        button.isUserInteractionEnabled = false
        return button
    }()
// MARK: - override functions
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        setup()
        hideKeyboardWhenTappedAround()
    }
// MARK: - Setup
    func setupView() {
        view.addSubviews([base.view, button])
    }
    func setupConstraints() {
        view.addConstraints([
            base.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            base.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            base.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            base.view.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            button.heightAnchor.constraint(equalToConstant: view.frame.height*0.05)
        ])
    }
    func setupPickerView(_ title: String, options: [String]) {
        let textFieldPicker = PickerViewCustom()
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
        base.stack.addArrangedSubview(textFieldPicker)
    }
}

extension RegisterViewController: DatePickerDelegate {
    func datePicker(_ toolBar: UIToolbar) {
        text.field.inputAccessoryView = toolBar
        text.field.inputView = datePicker
    }
    func doneButtonTarget() {
        dismissKeyboard()
    }
}
