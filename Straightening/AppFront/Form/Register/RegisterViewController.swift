//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

class RegisterViewController: UIViewController, SetupView {
// MARK: - Variables
    lazy var picker: (view: UIPickerView, options: [String]) = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        return (view: pickerView, options: [])
    }()
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(textFieldTarget), for: .editingChanged)
        return textField
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField])
        stackView.setUnderlineBorder()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var button = Create.baseButton("ENTRAR", backgroundColor: Assets.Colors.weakWhite)
// MARK: - override functions
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
    }
// MARK: - functions
    func setupPickerView(_ options: [String]) {
        picker.options = options
        picker.view.reloadAllComponents()
        view.addSubview(picker.view)
        textField.isUserInteractionEnabled = false
        picker.view.frame = CGRect(origin: CGPoint(x: view.frame.minX,
                                                  y: view.frame.maxY),
                                  size: CGSize(width: view.frame.width,
                                               height: 0))
        button.translatesAutoresizingMaskIntoConstraints = true
        button.frame = CGRect(origin: CGPoint(x: view.frame.minX,
                                              y: view.frame.maxY-view.frame.height*0.05),
                              size: CGSize(width: view.frame.width,
                                           height: view.frame.height*0.05))
        let pickerViewHeight = view.frame.height*0.3
        UIView.animate(withDuration: 0.5) {
            self.picker.view.frame.origin.y -= pickerViewHeight
            self.button.frame.origin.y -= pickerViewHeight
            self.picker.view.frame.size.height = pickerViewHeight
        }
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
// MARK: - objc functions
    @objc func textFieldTarget(_ sender: UITextField) {
        print(sender.text as Any)
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
