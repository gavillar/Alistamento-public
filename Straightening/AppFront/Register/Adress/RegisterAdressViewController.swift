//
//  RegisterAdressViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class RegisterAdressViewController: UIViewController {
// MARK: - var and let
    private let registeradressviewmodel = RegisterAdressViewModel()
    private lazy var baseView: UIView = {
        let verticalStack = VStack(addArrangedSubviews: [cepTextField,
                                                         streetLabel,
                                                         numberTextField,
                                                         districtLabel,
                                                         locationLabel])
        
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(verticalStack)
        verticalStack.enableAutolayout()
            .centerX()
            .centerY()
        return baseView
    }()
    let cepTextField: BindingTextField = {
       let textfield = BindingTextField()
        return textfield
    }()
    let streetLabel: UILabel = {
        let label = Create.label("", font: UIFont.boldSystemFont(ofSize: 22), alignment: .left, numberOfLines: 0)
        label.isHidden = true
        return label
    }()
    let districtLabel: UILabel = {
        let label = Create.label("", font: UIFont.boldSystemFont(ofSize: 18), alignment: .left, numberOfLines: 0)
        label.isHidden = true
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = Create.label("", font: UIFont.boldSystemFont(ofSize: 18), alignment: .left, numberOfLines: 0)
        label.isHidden = true
        return label
    }()
    let numberTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Número-Complemento",
                                                                attributes: [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.white])
        textfield.isHidden = true
        return textfield
    }()
// MARK: - registerButton
    private lazy var registerButton = Create.baseButton("ENTRAR", titleColor: Assets.Colors.brown) {_ in
        self.navigationController?.navigate(to: LoginViewController())
    }
// MARK: - viewDidLoad
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        title = "Endereço"
        setupView()
        setupConstraints()
        registeradressviewmodel.formViewModelDelegate = self
    }
// MARK: - setupView
    func setupView() {
        view.addSubviews([baseView, registerButton])
        view.hideKeyboardWhenTappedAround()
        setupCepTextField()
        sendCep()
        updateForm()
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
        cepTextField.becomeFirstResponder()
        cepTextField.setUnderlineTextFieldBorderWhite()
        cepTextField.delegate = self
        cepTextField.addTarget(self, action: #selector(tapCepTextField), for: .editingChanged)
        cepTextField.attributedPlaceholder = NSAttributedString(string: "Cep",
                                                                attributes: [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.white])
    }
    func sendCep() {
        cepTextField.bind { [weak self] text in
            self?.registeradressviewmodel.cep = text
        }
    }
// MARK: - tapCepTextField
        @objc func tapCepTextField(sender: UITextField) {
            guard let text = sender.text else {return}
            if text.validateCep(text)  {
                registeradressviewmodel.getApiCep()
            }
        }
}

extension RegisterAdressViewController: RegisterAdressViewModelProtocol {
    func sendCep(cep: Cep) {
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
