//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit

class RegisterViewController: UIViewController, SetupView {
// MARK: - Variables
    private lazy var picker: (view: UIPickerView, options: [String]) = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = Assets.Colors.whiteBlack
        return (view: pickerView, options: [])
    }()
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
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !textField.isUserInteractionEnabled && !button.translatesAutoresizingMaskIntoConstraints {
            showPickerView(height: view.frame.height*0.3)
        } else {
            hidePickerView()
        }
    }
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        touchesBegan(Set<UITouch>(), with: nil)
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
        picker.options = options
        picker.view.reloadAllComponents()
        view.addSubview(picker.view)
        textField.isUserInteractionEnabled = false
        picker.view.frame = CGRect(origin: CGPoint(x: view.frame.minX,
                                                  y: view.frame.maxY),
                                  size: CGSize(width: view.frame.width,
                                               height: 0))
        showPickerView(height: view.frame.height*0.3)
    }
    func showPickerView(height: CGFloat, duration: CGFloat = 0.5) {
        button.translatesAutoresizingMaskIntoConstraints = true
        button.frame = CGRect(origin: CGPoint(x: view.frame.minX,
                                              y: view.frame.maxY-view.frame.height*0.05),
                              size: CGSize(width: view.frame.width,
                                           height: view.frame.height*0.05))
        UIView.animate(withDuration: duration) {
            self.picker.view.frame.origin.y -= height
            self.button.frame.origin.y -= height
            self.picker.view.frame.size.height = height
        }
    }
    func hidePickerView(duration: CGFloat = 0.5) {
        let safeArea = self.view.safeAreaInsets
        if button.translatesAutoresizingMaskIntoConstraints {
            UIView.animate(withDuration: duration) {
                self.picker.view.frame.origin.y = self.view.frame.maxY
                self.button.frame.origin.y = self.view.frame.maxY-self.view.frame.height*0.05-safeArea.bottom
                self.picker.view.frame.size.height = 0
            } completion: {_ in
                self.button.translatesAutoresizingMaskIntoConstraints = false
            }
        }
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
