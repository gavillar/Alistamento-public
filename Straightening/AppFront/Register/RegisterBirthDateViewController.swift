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
        setTextFieldPlaceholder(datePicker.dayMonthYear)
        registerView.textField.delegate = self
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        unFreezeButton()
        datePicker.delegate = self
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.birthDate = registerView.textField.text
        self.navigationController?.navigate(to: RegisterAvaibleTimeViewController(registerViewModel))
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
