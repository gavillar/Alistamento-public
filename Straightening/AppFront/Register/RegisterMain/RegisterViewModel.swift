//
//  RegisterViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation
import Firebase

class RegisterViewModel {
    var auth = Auth.auth()
    var userToRegister: RegisterModel = RegisterModel()
    func register() {
        if let email = userToRegister.email,
           let password = userToRegister.password {
            auth.createUser(withEmail: email, password: password) {(_, error) in
                if let error = error {
                    print("ERROR: \(error)")
                } else {
                    print("Cadastro realizado com sucesso")
                }
            }
        } else {
            print("ERROR: Couldn't unwrap email/password")
        }
    }
}
