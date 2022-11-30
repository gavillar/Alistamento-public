//
//  RegisterViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation
import Firebase

protocol RegisterViewModelDelegate: AnyObject {
    func freezeButton()
    func unFreezeButton()
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    var auth: Auth?
    lazy var email: String = ""
    lazy var password: String = ""
    func setRegister() {
        if email.isEmpty && password.isEmpty {
            self.auth?.createUser(withEmail: email, password: password, completion: {(_, error) in
                if error != nil {
                    print("Falha ao Cadastrar")
                } else {
                    print("Cadastro Realizado")
                }
            })
        }
    }
    init(auth: Auth? = nil) {
        self.auth = auth
    }
    @discardableResult func changeButton(condition: Bool) -> Bool {
        if condition {
            delegate?.unFreezeButton()
        } else {
            delegate?.freezeButton()
        }
        return condition
    }
}
