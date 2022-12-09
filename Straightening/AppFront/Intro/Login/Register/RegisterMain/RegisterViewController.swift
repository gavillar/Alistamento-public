//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit
import Firebase

class RegisterViewController: UIViewController {
// MARK: - variables
    var registerViewModel: RegisterViewModel
    lazy var registerView = RegisterView(frame: view.frame)
    lazy var datePicker = DatePicker()
    lazy var pickerView = PickerView()
// MARK: - init
    init(_ registerViewModel: RegisterViewModel = RegisterViewModel()) {
        self.registerViewModel = registerViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - override functions
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.layer.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        view.hideKeyboardWhenTappedAround()
        view = registerView
        registerView.button.freezeButton()
        datePicker.addTarget(self, action: #selector(datePickerTarget), for: .valueChanged)
    }
// MARK: - funcs
    func setTextFieldPlaceholder(_ placeholder: String) {
        registerView.textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                  attributes: [
                                                                    NSAttributedString.Key.foregroundColor:
                                                                        UIColor.white
                                                                  ])
    }
// MARK: - @objc funcs
    @objc func datePickerTarget(_ sender: UIDatePicker) {
        registerView.textField.text = datePicker.dayMonthYear
    }
}

extension RegisterViewController: PickerViewDelegate {
    func pickerView(didSelect option: String) {
        registerView.textField.text = option
    }
    func pickerView(_ toolBar: UIToolbar) {
        registerView.textField.inputAccessoryView = toolBar
        registerView.textField.inputView = pickerView
    }
}

extension RegisterViewController: DatePickerDelegate {
    func datePicker(_ toolBar: UIToolbar) {
        registerView.textField.inputAccessoryView = toolBar
        registerView.textField.inputView = datePicker
    }
    func doneButtonTarget() {
        view.dismissKeyboard()
    }
}
