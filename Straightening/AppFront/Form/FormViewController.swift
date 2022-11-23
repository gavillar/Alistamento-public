//
//  FormViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class FormViewController: UIViewController, SetupView, UITextFieldDelegate {
    
    
    
// MARK: - var and let
    private let formviewmodel = FormViewModel()
    private var verticalStack = VStack()
    let streetLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let districtLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let locationLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let cepTextField = BindingCepTextField()
    let numberTextField = Create.textField(textColor: UIColor.white, placeholder: "Número", for: nil, handler: nil)

    //MARK: - registerButton
    private lazy var registerButton = Create.baseButton("Enviar",
                                                                  titleColor: Assets.Colors.brown,
                                                                  backgroundColor: Assets.Colors.weakWhite)
       
// MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .white
        setup()
        formviewmodel.formViewModelDelegate = self
    }

// MARK: - setupVerticalStackView
    func setupVerticalStackView() {
        verticalStack.addArrangedSubviewList(views: cepTextField,
                                                streetLabel,
                                             numberTextField,
                                             districtLabel,
                                             locationLabel)
        streetLabel.isHidden = true
        districtLabel.isHidden = true
        locationLabel.isHidden = true
        numberTextField.isHidden = true
        verticalStack.enableAutolayout()
        verticalStack.centerX(in: view)
    }
// MARK: - setupRequest
        func setupCepTextField() {
            cepTextField.bind { [weak self] text in
                self?.formviewmodel.cep = text
            }
            cepTextField.becomeFirstResponder()
            cepTextField.delegate = self
            cepTextField.addTarget(self, action: #selector(tapCepTextField), for: .editingChanged)
            cepTextField.attributedPlaceholder = NSAttributedString(string: "Cep", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let max = 8
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= max
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
// MARK: - setupView
        func setupView() {
            view.defaultBackground()
            view.addSubviews([verticalStack, registerButton])
            setupVerticalStackView()
            hideKeyboardWhenTappedAround()
            setupCepTextField()
        }
//MARK: - setupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
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
