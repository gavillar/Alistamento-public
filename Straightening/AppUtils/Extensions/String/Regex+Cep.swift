//
//  Regex+Cep.swift
//  Straightening
//
//  Created by user220831 on 11/22/22.
//

import Foundation
import UIKit

extension String {
    func validateCep(_ cep: String) -> Bool {
        let cepRegEx = "[0-9]{5}+[0-9]{3}||[0-9]{5}+-[0-9]{3}"
        let cepPred = NSPredicate(format: "SELF MATCHES %@", cepRegEx)
        if cepPred.evaluate(with: cep) {
            return true
        }
        return false
    }
}
