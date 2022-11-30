//
//  RegisterAvaibleTimeViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterAvaibleTimeViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Disponibilidade"
        setupPickerView("⇩ Disponibilidade", options: ["Manhã",
                                                                  "Tarde",
                                                                  "Noite",
                                                                  "Todos Horários"])
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    @objc func buttonTarget() {
        guard let count = text.field.text?.count else {return}
        if registerviewmodel.changeButton(condition: count > 0) {
            self.navigationController?.navigate(to: RegisterMinisteryViewController())
        }
    }
}

extension RegisterAvaibleTimeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= 0
    }
}
