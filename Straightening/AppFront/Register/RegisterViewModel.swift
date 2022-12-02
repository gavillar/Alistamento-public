//
//  RegisterViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation
import Firebase

class RegisterViewModel {
    var auth: Auth?
    var userToRegister: RegisterModel = RegisterModel()
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
}
