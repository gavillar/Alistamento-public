//
//  NetworkEndPoints.swift
//  Straightening
//
//  Created by Josicleison Elves on 28/12/22.
//

import Foundation

extension Network {
    enum EndPoints {
        static var books: URL? {URL(string: "https://www.abibliadigital.com.br/api/books")}
        static var cep: URL? {URL(string: "https://viacep.com.br/ws/59122017/json/")}
        static let cepInformation = {(cep: String? ) -> URL? in
            return URL(string: "https://viacep.com.br/ws/\(cep ?? "")/json/")
        }
    }
}
