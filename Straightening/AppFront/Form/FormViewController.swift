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
    private var verticalStack = VStack()
    let streetLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let districtLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let locationLabel = Create.label("", font: nil, alignment: .left, numberOfLines: 0)
    let cepTextField = Create.textField(textColor: nil, placeholder: "Cep", for: nil, keyboard: .numberPad, handler: nil)
    let numberTextField = Create.textField(textColor: UIColor.white, placeholder: "Número", for: nil, handler: nil)

    //MARK: - registerButton
    private lazy var registerButton = Create.baseButton("Enviar",
                                                                  titleColor: Assets.Colors.brown,
                                                                  backgroundColor: Assets.Colors.weakWhite)
       
// MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .white
        setup()
    }
// MARK: - getApiCep
    func getApiCep() {
        Task {
            guard let data = await Network.call(from: Network.EndPoints.cepInformation(cepTextField.text)) else {return}
            guard let cep = Network.decode(Cep.self, from: data) else {return}
            streetLabel.text = cep.logradouro
            locationLabel.text = cep.localidade
            districtLabel.text = cep.bairro
        }
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
        func setupRequest() {
            cepTextField.becomeFirstResponder()
            cepTextField.addTarget(self, action: #selector(tapCepTextField), for: .editingChanged)
        }
// MARK: - tapCepTextField
        @objc func tapCepTextField(sender: UITextField) {
            if validateCep(sender.text ?? "") {
                getApiCep()
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
            setupRequest()
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
