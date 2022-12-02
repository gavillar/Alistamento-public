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
        textField.delegate = self
        setTextFieldPlaceholder("Manhã")
        pickerView.options = ["Manhã", "Tarde",
                              "Noite", "Todos Horários"]
        pickerView.pickerViewDelegate = self
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        unFreezeButton()
    }
    @objc func buttonTarget() {
        registerViewModel.userToRegister.avaibleTime = textField.text
        self.navigationController?.navigate(to: RegisterMinisteryViewController(registerViewModel))
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
