//
//  FormModel.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation
import UIKit

struct Cep: Codable {
    var cep: String?
    var logradouro: String?
    var complemento: String?
    var bairro: String?
    var localidade: String?
    var uf: String?
    var ibge: Int?
    var gia: Int?
    var ddd: Int?
    var siafi: Int?
}
