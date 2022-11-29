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
            .centerX()
            .centerY()
        return baseView
    }()
    let streetLabel = Create.label("", font: UIFont.boldSystemFont(ofSize: 22), alignment: .left, numberOfLines: 0)
    let districtLabel = Create.label("", font: UIFont.boldSystemFont(ofSize: 18), alignment: .left, numberOfLines: 0)
    let locationLabel = Create.label("", font: UIFont.boldSystemFont(ofSize: 18), alignment: .left, numberOfLines: 0)
    let cepTextField = BindingTextField()
    let numberTextField = Create.textField(textColor: Assets.Colors.whiteBlack, placeholder: "Número-Complemento")
// MARK: - registerButton
    private lazy var registerButton = Create.baseButton("ENTRAR", titleColor: Assets.Colors.brown) {_ in
        self.navigationController?.navigate(to: LoginViewController())
    }
// MARK: - viewDidLoad
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.defaultBackground()
    }
    override func loadView() {
        super.loadView()
        title = "Endereço"
        setup()
        formviewmodel.formViewModelDelegate = self
    }
// MARK: - setupView
    func setupView() {
        view.addSubviews([baseView, registerButton])
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
        NSLayoutConstraint.activate([
            
            cepTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  40),
            cepTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        
        ])
        
    }
// MARK: - setupCepTextField
    func setupCepTextField() {
        cepTextField.bind { [weak self] text in
            self?.formviewmodel.cep = text
        }
        cepTextField.becomeFirstResponder()
        cepTextField.setUnderlineTextFieldBorderWhite()
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
            streetLabel.text = "Endereço:\n\n\(cep.logradouro ?? "")"
            districtLabel.text = "Bairro: \(cep.bairro ?? "")"
            locationLabel.text = "Cidade: \(cep.localidade ?? "") \(cep.uf ?? "")"
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
