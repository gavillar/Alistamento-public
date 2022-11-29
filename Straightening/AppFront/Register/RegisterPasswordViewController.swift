//
//  RegisterPasswordViewController.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation
import UIKit

final class RegisterPasswordViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Senha"
        text.setPlaceholder("Senha")
        text.field.becomeFirstResponder()
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
    func setupPasswordText() {
       text.field.bind { text in
           self.registerviewmodel.email = text
       }
   }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.navigate(to: RegisterBirthDateViewController())
    }
}
