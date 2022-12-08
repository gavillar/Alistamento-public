//
//  RegisterViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

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
    func verifyIfEmailExists() async -> Bool {
        if let result = try? await auth.fetchSignInMethods(forEmail: userToRegister.email ?? ""),
           result != [] {
            print("ERROR: This email already exists"); return true
        }
        return false
    }
}
