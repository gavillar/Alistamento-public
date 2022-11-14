//
//  RegisterBirthDateViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

class RegisterBirthDateViewController: RegisterNameViewController {
    override func loadView() {
        super.loadView()
        textField.attributedPlaceholder = NSAttributedString(string: "⇩ Data de Nascimento",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        button.removeAction(action, for: .touchUpInside)
        action = UIAction {_ in
            self.navigationController?.pushViewController(RegisterAvaibleTimeViewController(),
                                                          animated: true)
        }
        button.addAction(action, for: .touchUpInside)
    }
}
