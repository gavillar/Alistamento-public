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
        textField.attributedPlaceholder = NSAttributedString(string: "⇩ Data de Nascimento",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        textField.delegate = self
        setupPickerView([])
        birthDatePicker()
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }

// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterAvaibleTimeViewController())
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
