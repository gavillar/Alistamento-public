//
//  RegisterEmailViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterEmailViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        title = "Email"
        text.setPlaceholder("Email")
        text.field.becomeFirstResponder()
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
    func setupEmailText() {
       text.field.bind { text in
           self.registerviewmodel.email = text
           print(text)
       }
   }
// MARK: - objc functions
    @objc func buttonTarget() {
        setupEmailText()
        print("tap email")
        self.navigationController?.navigate(to: RegisterPasswordViewController())
    }
}
