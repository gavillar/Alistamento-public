//
//  FormViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class FormViewController: UIViewController, SetupView {
   
    
        //MARK: - nameStackView
        private lazy var nameStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [nameTextField])
            view.alignment = .leading
            view.spacing = 1
            view.setUnderlineBorder()
            view.distribution = .fill
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - nameTextField
    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.keyboardType = .default
        view.attributedPlaceholder = NSAttributedString(string: "Nome Completo", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
        
        //MARK: - telephoneStackView
        private lazy var telephoneStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [telephoneTextField])
            view.setUnderlineBorder()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - telephoneTextField
        private lazy var telephoneTextField: UITextField = {
            let view = UITextField()
            view.tag = 1
            view.delegate = self
            view.attributedPlaceholder = NSAttributedString(string: "Telefone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            view.keyboardType = .numberPad
            view.textAlignment = .left
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - emailStackView
        private lazy var emailStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [emailTextField])
            view.setUnderlineBorder()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - emailTextField
        private lazy var emailTextField: UITextField = {
            let view = UITextField()
            view.keyboardType = .emailAddress
            view.autocapitalizationType = UITextAutocapitalizationType.none
            view.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            view.textAlignment = .left
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - monthlyStackView
        private lazy var monthlyStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [ministryTextField])
            view.spacing = 60
            view.distribution = .fill
            view.setUnderlineBorder()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
     
        //MARK: - ministryTextField
        //NO PERMISSION PASTE ***
        private lazy var ministryTextField: PickerViewMinisteryTextField = {
            let view = UiTextFieldNoPaste()
            view.translatesAutoresizingMaskIntoConstraints = false
            return PickerViewMinisteryTextField()
        }()
        
        //MARK: - birthDateStackView
        private lazy var birthDateStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [birthDateTextField])
            view.spacing = 50
            view.distribution = .fill
            view.setUnderlineBorder()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - birthDateTextField
        //NO PERMISSION PASTE ***
        private lazy var birthDateTextField: UITextField = {
            let view = UiTextFieldNoPaste()
            view.textAlignment = .left
            view.attributedPlaceholder = NSAttributedString(string: "⇩ Data de Nascimento", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - ToolBar
        private func toolBar() -> UIToolbar {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(tapDoneButton))
            toolBar.setItems([doneButton], animated: true)
            return toolBar
        }
        
       //MARK: - tapDoneButton
        @objc private func tapDoneButton() {
            let dataFormartter = DateFormatter()
            dataFormartter.dateStyle = .medium
            dataFormartter.timeStyle = .none
            self.birthDateTextField.text = dataFormartter.string(from: datePicker.date)
           
            
        }
        
        //MARK: - datePicker
        let datePicker = UIDatePicker()
        private func setupDatePicker() {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
            birthDateTextField.inputView = datePicker
            birthDateTextField.inputAccessoryView = toolBar()
            
        }
        
        //MARK: - avaliableStackView
        private lazy var avaliableStackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [avaliableTimeTextField])
            view.setUnderlineBorder()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //MARK: - avaliableTimeTextField
        //NO PERMISSION PASTE ***
        lazy var avaliableTimeTextField: PickerViewAvaliableTimeTextField = {
            let view = UiTextFieldNoPaste()
            view.translatesAutoresizingMaskIntoConstraints = false
            return PickerViewAvaliableTimeTextField()
        }()
    
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
        setupDatePicker()
        setupPickerView()
    }
    
    
    //MARK: - setupView
    func setupView() {
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.green?.cgColor as Any,
                           Assets.Colors.lightGreen?.cgColor as Any]

        view.layer.insertSublayer(gradient, at: 0)
        
        view.addSubview(registerButton)
        view.addSubview(telephoneStackView)
        view.addSubview(nameStackView)
        view.addSubview(emailStackView)
        view.addSubview(monthlyStackView)
        view.addSubview(birthDateStackView)
        view.addSubview(avaliableStackView)
        hideKeyboardWhenTappedAround()
    }
    
   
    
    //MARK: - setupPickerView
    func setupPickerView() {
        
        //MARK: - ministryTextField
        ministryTextField.pickerMontlhy = ["Pastoral", "Missões", "Família", "Discipulado", "Serviço", "Adoração" ]
        ministryTextField.textAlignment = .left
        ministryTextField.attributedPlaceholder = NSAttributedString(string: "⇩ Ministério", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        ministryTextField.displayNameHandler = {item in
            return (item as? String) ?? ""
        }
        ministryTextField.itemSelectionHandler = { index, item in
            print("\(index), \(item as? String)")
        }
        
        
        //MARK: - netWorthTextField
        avaliableTimeTextField.pickerNetWorth = ["Manhã", "Tarde", "Noite", "Todos"]
        avaliableTimeTextField.textAlignment = .left
        avaliableTimeTextField.attributedPlaceholder = NSAttributedString(string: "⇩ Disponibilidade de Horário", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        avaliableTimeTextField.displayNameHandler = {item in
            return (item as? String) ?? ""
        }
        avaliableTimeTextField.itemSelectionHandler = { index, item in
            print("\(index), \(item as? String)")
        }
    }
    
    //MARK: - setupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
        
            nameStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            nameStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            nameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            telephoneStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 20),
            telephoneStackView.widthAnchor.constraint(equalTo: nameStackView.widthAnchor),
            telephoneStackView.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor),
            
            emailStackView.topAnchor.constraint(equalTo: telephoneStackView.bottomAnchor, constant: 20),
            emailStackView.widthAnchor.constraint(equalTo: telephoneStackView.widthAnchor),
            emailStackView.leadingAnchor.constraint(equalTo: telephoneStackView.leadingAnchor),
            
            monthlyStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 20),
            monthlyStackView.widthAnchor.constraint(equalTo: emailStackView.widthAnchor),
            monthlyStackView.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor),
            
            birthDateStackView.topAnchor.constraint(equalTo: monthlyStackView.bottomAnchor, constant: 20),
            birthDateStackView.widthAnchor.constraint(equalTo: monthlyStackView.widthAnchor),
            birthDateStackView.leadingAnchor.constraint(equalTo: monthlyStackView.leadingAnchor),
            
            avaliableStackView.topAnchor.constraint(equalTo: birthDateStackView.bottomAnchor, constant: 20),
            avaliableStackView.widthAnchor.constraint(equalTo: birthDateStackView.widthAnchor),
            avaliableStackView.leadingAnchor.constraint(equalTo: birthDateStackView.leadingAnchor),
            
            
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            
            
                        
        ])
    }
    }
        
      
    //MARK: - extensions
    extension String {
        
        func formatMask(mask: String) -> String {
            let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
            var result = ""
            var startIndex = cleanField.startIndex
            let endIndex = cleanField.endIndex
            
            for ch in mask where startIndex < endIndex {
                if ch == "#" {
                    result.append(cleanField[startIndex])
                    startIndex = cleanField.index(after: startIndex)
                } else {
                    result.append(ch)
                }
            }
            
            return result
        }
        
        func clearFormatMask() -> String{
            return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        }
        
    }

    extension FormViewController: UITextFieldDelegate{
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            additionalCellTextFieldSetup(textField)
        }
        
        func additionalCellTextFieldSetup(_ textField: UITextField?) {
            switch textField?.tag{
            case 1:
                textField?.text = textField?.text?.formatMask(mask: "###.###.###-##")
            default:
                break
            }
        }
        
    }




