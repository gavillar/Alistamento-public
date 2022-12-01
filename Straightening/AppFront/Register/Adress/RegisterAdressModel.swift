//
//  RegisterAdressModel.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation

struct Cep: Codable {
    let cep: String?
    let logradouro: String?
    let complemento: String?
    let bairro: String?
    let localidade: String?
    let uf: String?
    let ibge: String?
    let gia: String?
    let ddd: String?
    let siafi: String?
}
