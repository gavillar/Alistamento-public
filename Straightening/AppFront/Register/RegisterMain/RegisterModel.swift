//
//  RegisterModel.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation

struct RegisterModel {
    struct Cep: Codable {
        var cep: String?
        var logradouro: String?
        var complemento: String?
        var bairro: String?
        var localidade: String?
        var uf: String?
        var ibge: String?
        var gia: String?
        var ddd: String?
        var siafi: String?
    }
    var name: String?
    var phone: String?
    var email: String?
    var password: String?
    var birthDate: String?
    var avaibleTime: String?
    var ministery: String?
    var address: Cep?
    init() {
        self.name = nil
        self.phone = nil
        self.email = nil
        self.password = nil
        self.birthDate = nil
        self.avaibleTime = nil
        self.ministery = nil
        self.address = nil
    }
}
