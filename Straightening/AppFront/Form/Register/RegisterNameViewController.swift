//
//  ComoEuFariaViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterNameViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Nome Completo"
        text.setPlaceholder("Nome Completo")
        text.field.becomeFirstResponder()
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterPhoneViewController())
    }
}
