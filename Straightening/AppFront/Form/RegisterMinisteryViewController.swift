//
//  RegisterMinisteryViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//
import UIKit

class RegisterMinisteryViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        textField.attributedPlaceholder = NSAttributedString(string: "⇩ Ministério",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        setupPickerView(["Pastoral", "Missões", "Família", "Discipulado", "Serviço", "Adoração"])
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        
//        textField.inputView = picker.view
//
//        let toolBar = UIToolbar()
//        toolBar.barStyle = .default
//        toolBar.sizeToFit()
//
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(buttonTarget))
//        toolBar.setItems([spaceButton, doneButton], animated: false)
//        textField.inputAccessoryView = toolBar
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.pushViewController(RegisterBirthDateViewController(),
                                                      animated: true)
    }
}
