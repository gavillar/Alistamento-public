//
//  RegisterModel.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation

struct RegisterModel {
    var name: String?
    var phone: String?
    var email: String?
    var password: String?
    var birthDate: String?
    var avaibleTime: String?
    var ministery: String?
    init() {
        self.name = nil
        self.phone = nil
        self.email = nil
        self.password = nil
        self.birthDate = nil
        self.avaibleTime = nil
        self.ministery = nil
    }
}
