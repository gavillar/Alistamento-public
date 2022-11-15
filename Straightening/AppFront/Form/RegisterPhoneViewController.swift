//
//  RegisterPhoneViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterPhoneViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        textField.attributedPlaceholder = NSAttributedString(string: "Telefone",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.pushViewController(RegisterEmailViewController(),
                                                      animated: true)
    }
}
