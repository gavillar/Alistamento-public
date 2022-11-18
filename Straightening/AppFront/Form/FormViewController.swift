//
//  FormViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class FormViewController: UIViewController, SetupView, SendResultCepProtocol {
    func sendApiCep(cep: Cep) {
        streetLabel.text = cep.logradouro
    }
    
    
// MARK: - var and let
    private var verticalStack = VStack()
    let streetLabel = Create.label("streetLabel", font: nil)
    let districtLabel = Create.label("districtLabel", font: nil)
    let locationLabel = Create.label("locationLabel", font: nil)
    let cepTextField = Create.textField(textColor: UIColor.white, placeholder: "Cep", for: nil, handler: nil)
    let numberTextField = Create.textField(textColor: UIColor.white, placeholder: "Número", for: nil, handler: nil)
    private let formviewmodel = FormViewModel()
    

    //MARK: - registerButton
    private lazy var registerButton = Create.baseButton("Enviar",
                                                                  titleColor: Assets.Colors.brown,
                                                                  backgroundColor: Assets.Colors.lightGreen)
       


    //MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.tabBarItem.title = "teste"
        setupView()
        setupConstraints()
        formviewmodel.sendCepDelegate = self
      
    }
    //MARK: - setupView
    func setupView() {
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.lightGreen?.cgColor as Any]

        view.layer.insertSublayer(gradient, at: 0)
        view.addSubviews([verticalStack,registerButton])
        setupVerticalStackView()
        hideKeyboardWhenTappedAround()
    }
    func setupVerticalStackView() {
        verticalStack.addArrangedSubviewList(views: cepTextField,
                                                streetLabel,
                                             numberTextField,
                                             districtLabel,
                                             locationLabel)
        verticalStack.enableAutolayout()
        verticalStack.centerX(in: view)
        verticalStack.centerY(in: view)
    }
    //MARK: - setupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            
            
                        
        ])
    }


}
