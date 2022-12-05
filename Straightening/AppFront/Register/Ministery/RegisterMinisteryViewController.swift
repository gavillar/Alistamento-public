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
        title = "Ministério"
        registerView.textField.delegate = self
        setTextFieldPlaceholder("Pastoral")
        pickerView.options = ["Pastoral", "Missões",
                              "Família", "Discipulado",
                              "Serviços", "Adoração"]
        pickerView.pickerViewDelegate = self
        registerView.button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        registerView.button.unFreezeButton()
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        registerViewModel.userToRegister.ministery = pickerView.selectedOption
        self.navigationController?.navigate(to: RegisterAdressViewController(registerViewModel))
    }
}

extension RegisterMinisteryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= 0
    }
}
