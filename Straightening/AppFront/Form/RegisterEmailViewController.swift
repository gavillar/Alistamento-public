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
        textField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        self.navigationController?.pushViewController(RegisterMinisteryViewController(),
                                                      animated: true)
    }
}
