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
        print(cep)
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
       

    private lazy var labelTest: UILabel = {
       let label = UILabel()
        label.text = "teste"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
        
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        formviewmodel.sendCepDelegate = self
        
        getBooks()
        
    
      
    }

func getBooks() {
    
    guard let url = URL(string: "viacep.com.br/ws/06220060/json/") else {return}
   
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error == nil {
            print("not nil")
        }
            guard let data = data else {return}
            
            let result = try? JSONDecoder().decode(Cep.self, from: data)
        print("status 200")
        print(result as Any)
    }.resume()
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
                                             locationLabel,
                                                labelTest)
        verticalStack.enableAutolayout()
        verticalStack.centerX(in: view)
        verticalStack.centerY(in: view)
    }
    //MARK: - setupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            labelTest.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelTest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            
            
                        
        ])
    }


}
