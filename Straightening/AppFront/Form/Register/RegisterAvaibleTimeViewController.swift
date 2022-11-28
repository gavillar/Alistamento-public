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
        self.navigationController?.navigate(to: FormViewController())
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
