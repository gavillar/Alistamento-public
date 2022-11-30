//
//  Regex+Password.swift
//  Straightening
//
//  Created by user220831 on 11/29/22.
//

import Foundation
import UIKit

extension UITextField {
//MARK: - isValidPassword
     func isValidPassword(_ senha: String) -> Bool {
        let passwordRegex =  ".{8,}"
        let validatePassowrd = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return validatePassowrd.evaluate(with: self.text)
    }
}
