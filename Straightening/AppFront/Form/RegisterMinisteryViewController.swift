//
//  RegisterMinisteryViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

class RegisterMinisteryViewController: RegisterNameViewController {
    override func loadView() {
        super.loadView()
        textField.attributedPlaceholder = NSAttributedString(string: "⇩ Ministério",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        button.removeAction(action, for: .touchUpInside)
        action = UIAction {_ in
            self.navigationController?.pushViewController(RegisterBirthDateViewController(),
                                                          animated: true)
        }
        button.addAction(action, for: .touchUpInside)
    }
}
