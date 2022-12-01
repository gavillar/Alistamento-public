//
//  LoginViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/30/22.
//

import Foundation
import Firebase
import UIKit

protocol UpdateFormViewModel {
    func updateForm()
}
protocol AuthenticationLoginViewModel {
    var formatIsValid: Bool {get}
    var backgroundCollorButton: UIColor {get}
    var titleColorButton: UIColor {get}
}
protocol AuthenticationDelegate: AnyObject {
    func nextView()
}
struct LoginViewModel: AuthenticationLoginViewModel {
    weak var authenticationdelegate: AuthenticationDelegate?
    var auth = Auth.auth()
    var email: String?
    var password: String?
    var formatIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && email?.isEmail() == true
    }
    var backgroundCollorButton: UIColor {
        return formatIsValid ? UIColor(red: 152/155, green: 251/155, blue: 144/155, alpha: 1) : UIColor.white.withAlphaComponent(0.5)
    }
    var titleColorButton: UIColor {
        return formatIsValid ? .black : UIColor(white: 1, alpha: 0.67)
    }
    func performLogin() {
        guard let email = email else {return}
        guard let password = password else {return}
        self.auth.signIn(withEmail: email, password: password, completion: {(user, error) in
            if let error = error {
                print("Falha ao Cadastrar\(error.localizedDescription)")
                return
            }
            self.authenticationdelegate?.nextView()
            print("Login efetuado com Sucesso")
        })
    }
}
    
    
    
