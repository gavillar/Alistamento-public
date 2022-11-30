//
//  RegisterBirthDateViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterBirthDateViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Data de Nascimento"
        text.setPlaceholder("⇩ Data de Nascimento")
        text.field.delegate = self
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        datePicker.delegate = self
        datePicker.addTarget(self, action: #selector(datePickerTarget), for: .valueChanged)
    }
// MARK: - objc functions
    @objc func datePickerTarget(_ sender: UIDatePicker) {
        text.field.text = datePicker.dayMonthYear
    }
    @objc func buttonTarget() {
        guard let count = text.field.text?.count else {return}
        if registerviewmodel.changeButton(condition: count == 8) {
            self.navigationController?.navigate(to: RegisterAvaibleTimeViewController())
        }
    }
}

extension RegisterBirthDateViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= 0
    }
}
