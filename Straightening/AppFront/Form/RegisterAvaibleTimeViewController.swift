//
//  RegisterAvaibleTimeViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import UIKit

final class RegisterAvaibleTimeViewController: RegisterViewController {
    override func loadView() {
        super.loadView()
        textField.attributedPlaceholder = NSAttributedString(string: "⇩ Disponibilidade de Horário",
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor:
                                                                    UIColor.white
                                                             ])
        button.addTarget(nil, action: #selector(buttonTarget), for: .touchUpInside)
    }
// MARK: - objc functions
    @objc func buttonTarget() {
        pop(to: LoginViewController.self)
    }
    func pop<T: UIViewController>(to: T.Type) {
        guard let viewControllers = navigationController?.viewControllers else {return}
        for viewController in viewControllers where ((viewController as? T) != nil) {
            self.navigationController?.popToViewController(viewController,
                                                           animated: true)
        }
    }
}
