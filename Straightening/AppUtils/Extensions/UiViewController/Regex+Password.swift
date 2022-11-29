//
//  Regex+Password.swift
//  Straightening
//
//  Created by user220831 on 11/29/22.
//

import Foundation
import UIKit

extension UITextField {
//MARK: - VALIDATE PASSOWRD
     func isValidPassword(_ senha: String) -> Bool {
        let passwordRegex =  ".{6,}"
        let validatePassowrd = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return validatePassowrd.evaluate(with: passwordRegex)
    }
}
