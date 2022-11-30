//
//  Regex+Email.swift
//  Straightening
//
//  Created by user220831 on 11/29/22.
//

import Foundation
import UIKit

extension UITextField {
//MARK: - isValidEmail
     func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return validateEmail.evaluate(with: email)
    }
}
