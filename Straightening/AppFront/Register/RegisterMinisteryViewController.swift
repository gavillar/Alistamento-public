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
        textField.delegate = self
        setTextFieldPlaceholder("Pastoral")
        pickerView.options = ["Pastoral", "Missões",
                              "Família", "Discipulado",
                              "Serviços", "Adoração"]
        pickerView.pickerViewDelegate = self
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        unFreezeButton()
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterAdressViewController())
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
