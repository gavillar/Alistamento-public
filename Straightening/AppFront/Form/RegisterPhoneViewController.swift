//
//  RegisterPhoneViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

class RegisterPhoneViewController: RegisterNameViewController {
    override func loadView() {
        super.loadView()
        textField.attributedPlaceholder = NSAttributedString(string: "Telefone",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        button.removeAction(action, for: .touchUpInside)
        action = UIAction {_ in
            self.navigationController?.pushViewController(RegisterEmailViewController(),
                                                          animated: true)
        }
        button.addAction(action, for: .touchUpInside)
    }
}
