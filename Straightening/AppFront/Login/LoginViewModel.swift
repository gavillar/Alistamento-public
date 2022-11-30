//
//  LoginViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/30/22.
//

import Foundation
import Firebase

class LoginViewModel {
    
    var auth: Auth?
    init() {
        self.auth = Auth.auth()
    }
    func performLogin() {
        print("performLogin")
        guard let email = UserDefaults.standard.string(forKey: "loginEmail") else {return}
        print(email)
        guard let password = UserDefaults.standard.string(forKey: "loginPassword") else {return}
        print(password)
        self.auth?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print("Dados incorretos, tente novamente")
            } else {
                if user == nil {
                    print("Problema")
                } else {
                    print("Login feito com sucesso")
                }
                
            }
        })
        
    }
    
}
