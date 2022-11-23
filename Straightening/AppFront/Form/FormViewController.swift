//
//  FormViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class FormViewController: UIViewController, SetupView {
// MARK: - var and let
    private let formviewmodel = FormViewModel()
    private lazy var baseView: UIView = {
        let verticalStack = VStack(addArrangedSubviews: [cepTextField,
                                                         streetLabel,
                                                         numberTextField,
                                                         districtLabel,
                                                         locationLabel])
        streetLabel.isHidden = true
        districtLabel.isHidden = true
        locationLabel.isHidden = true
        numberTextField.isHidden = true
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(verticalStack)
        verticalStack.enableAutolayout()
            .centerX(in: baseView)
            .centerY(in: baseView)
        return baseView
    }()
    let streetLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let districtLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let locationLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let cepTextField = BindingCepTextField()
    let numberTextField = Create.textField(textColor: UIColor.white, placeholder: "Número", for: nil, handler: nil)
// MARK: - registerButton
    private lazy var registerButton = Create.baseButton("Enviar", titleColor: Assets.Colors.brown,
                                                        backgroundColor: Assets.Colors.weakWhite)
// MARK: - viewDidLoad
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setup()
        formviewmodel.formViewModelDelegate = self
    }
// MARK: - setupView
    func setupView() {
        view.defaultBackground()
        view.addSubviews([baseView, registerButton])
        setupVerticalStackView()
        hideKeyboardWhenTappedAround()
        setupCepTextField()
    }
// MARK: - setupConstraints
    func setupConstraints() {
        baseView.enableAutolayout()
            .top(in: view.safeAreaLayoutGuide)
            .leading(in: view.safeAreaLayoutGuide)
            .trailing(in: view.safeAreaLayoutGuide)
            .constraint(.bottom, to: view.keyboardLayoutGuide, itemAttribute: .top)
        registerButton
            .leading(in: view.safeAreaLayoutGuide)
            .trailing(in: view.safeAreaLayoutGuide)
            .bottom(in: view.safeAreaLayoutGuide)
            .height(multiplier: 0.05)
    }
// MARK: - setupVerticalStackView
    func setupVerticalStackView() {
    }
// MARK: - setupRequest
    func setupCepTextField() {
        cepTextField.bind { [weak self] text in
            self?.formviewmodel.cep = text
        }
        cepTextField.becomeFirstResponder()
        cepTextField.delegate = self
        cepTextField.addTarget(self, action: #selector(tapCepTextField), for: .editingChanged)
        cepTextField.attributedPlaceholder = NSAttributedString(string: "Cep",
                                                                attributes: [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.white])
    }
// MARK: - tapCepTextField
        @objc func tapCepTextField(sender: UITextField) {
            if validateCep(sender.text ?? "") {
                formviewmodel.getApiCep()
                streetLabel.isHidden = false
                districtLabel.isHidden = false
                locationLabel.isHidden = false
                numberTextField.isHidden = false
            }
        }
}

extension FormViewController: FormViewModelProtocol {
    func sendCep(cep: Cep) {
        Task {
            streetLabel.text = cep.logradouro
            districtLabel.text = cep.bairro
            locationLabel.text = cep.localidade
        }
    }
}

extension FormViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let max = 8
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= max
    }
}
