//
//  RegisterAdressViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class RegisterAdressViewController: RegisterViewController {
// MARK: - var and let
    private let registerAdressViewModel = RegisterAdressViewModel()
    lazy var streetLabel: UILabel = {
        let streetLabel = UILabel()
        streetLabel.font = registerView.textField.font
        streetLabel.textAlignment = .left
        streetLabel.isHidden = true
        return streetLabel
    }()
    lazy var districtLabel: UILabel = {
        let districtLabel = UILabel()
        districtLabel.font = registerView.textField.font
        districtLabel.textAlignment = .left
        districtLabel.isHidden = true
        return districtLabel
    }()
    lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = registerView.textField.font
        locationLabel.textAlignment = .left
        locationLabel.isHidden = true
        return locationLabel
    }()
    lazy var numberTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Número-Complemento",
                                                                attributes: [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.white])
        textfield.isHidden = true
        return textfield
    }()
// MARK: - viewDidLoad
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.layer.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        registerView.baseStackView.addArrangedSubviews([registerView.textField,
                                                        streetLabel,
                                                        numberTextField,
                                                        districtLabel,
                                                        locationLabel])
        title = "Endereço"
        setupView()
        registerAdressViewModel.formViewModelDelegate = self
    }
// MARK: - setupView
    func setupView() {
        view.hideKeyboardWhenTappedAround()
        setupCepTextField()
        sendCep()
        updateForm()
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
// MARK: - setupCepTextField
    func setupCepTextField() {
        registerView.textField.becomeFirstResponder()
        registerView.textField.delegate = self
        registerView.textField.addTarget(self, action: #selector(tapCepTextField), for: .editingChanged)
        numberTextField.addTarget(self, action: #selector(numberTextFieldTarget), for: .editingChanged)
        registerView.textField.attributedPlaceholder = NSAttributedString(string: "Cep",
                                                                attributes: [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.white])
    }
    func sendCep() {
        registerView.textField.bind {[weak self] text in
            self?.registerAdressViewModel.cep = text
        }
    }
// MARK: - tapCepTextField
    @objc func tapCepTextField(sender: UITextField) {
        guard let text = sender.text else {return}
        if text.validateCep(text) {
            self.registerAdressViewModel.getApiCep()
        }
    }
// MARK: - tapCepTextField
    @objc func numberTextFieldTarget(sender: UITextField) {
        registerView.button.performSelection(condition: sender.text != nil)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        print(registerViewModel.userToRegister)
        registerViewModel.register()
        self.navigationController?.navigate(to: LoginViewController())
    }
}

extension RegisterAdressViewController: RegisterAdressViewModelProtocol {
    func sendCep(cep: RegisterModel.Cep) {
        Task {
            streetLabel.text = "Endereço:\n\n\(cep.logradouro ?? "")"
            districtLabel.text = "Bairro: \(cep.bairro ?? "")"
            locationLabel.text = "Cidade: \(cep.localidade ?? "") \(cep.uf ?? "")"
        }
    }
}
extension RegisterAdressViewController: UpdateFormAdressViewModel {
    func updateForm() {
        streetLabel.isHidden = false
        districtLabel.isHidden = false
        locationLabel.isHidden = false
        numberTextField.isHidden = false
    }
}

extension RegisterAdressViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let max = 8
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= max
    }
}
