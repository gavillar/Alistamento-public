//
//  RegisterPhoneViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterPhoneViewController: RegisterViewController, UITextFieldDelegate {
    override func loadView() {
        super.loadView()
        title = "Telefone"
        text.setPlaceholder("Telefone")
        text.field.becomeFirstResponder()
        text.field.tag = 1
        text.field.delegate = self
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterEmailViewController())
    }
}
