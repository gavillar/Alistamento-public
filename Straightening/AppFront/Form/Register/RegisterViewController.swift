//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit

class RegisterViewController: UIViewController, SetupView {
// MARK: - Variables
    private lazy var baseView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [textField])
        stackView.setUnderlineBorder()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: baseView.widthAnchor, multiplier: 0.85).isActive = true
        stackView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        return baseView
    }()
    lazy var picker: (view: UIPickerView, options: [String]) = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = Assets.Colors.whiteBlack
        return (view: pickerView, options: [])
    }()
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(textFieldTarget), for: .editingChanged)
        return textField
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
        view.addSubviews([baseView, button])
    }
    func setupConstraints() {
        view.addConstraints([
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
// MARK: - functions
    func setupPickerView(_ options: [String]) {
        textField.inputView = picker.view
        picker.options = options
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        doneButton.tintColor = Assets.Colors.brown
        toolBar.setItems([spaceButton, doneButton], animated: false)
        textField.inputAccessoryView = toolBar
    }
// MARK: - objc functions
    @objc func textFieldTarget(_ sender: UITextField) {
        print(sender.text as Any)
    }
    @objc func done() {
        dismissKeyboard()
        let dataFormartter = DateFormatter()
        dataFormartter.dateStyle = .medium
        dataFormartter.timeStyle = .none
        textField.text = dataFormartter.string(from: datePicker.date)
    }
//MARK: - datePicker
            let datePicker = UIDatePicker()
            func birthDatePicker() {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
            textField.inputView = datePicker
    }
}

extension RegisterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker.options[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = picker.options[row]
    }
}
