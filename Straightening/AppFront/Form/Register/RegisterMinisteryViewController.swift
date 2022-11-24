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
        setupPickerView()
        textField.removeFromSuperview()
        baseView.stack.addArrangedSubview(textFieldPicker)
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
    func setupPickerView() {
        textFieldPicker.attributedPlaceholder = NSAttributedString(string: "⇩ Ministério",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        textFieldPicker.pickerMinistery = ["Pastoral", "Missões", "Família", "Discipulado", "Serviços", "Adoração"]
        textFieldPicker.displayNameHandler = {item in
            return (item as? String) ?? ""
        }
        self.textFieldPicker.itemSelectionHandler = { index, item in
            print("\(index), \(item as? String)")
        }
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterBirthDateViewController())
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
