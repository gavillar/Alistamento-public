//
//  Network.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import Foundation

struct Network {
    enum EndPoints {
        static var books: URL? {URL(string: "https://www.abibliadigital.com.br/api/books")}
        static var cep: URL? {URL(string: "https://viacep.com.br/ws/59122017/json/")}
        static let cepInformation = {(cep: String? ) -> URL? in
            return URL(string: "https://viacep.com.br/ws/\(cep ?? "")/json/")
        }
    }
    static func call(from url: URL?) async -> Data? {

        guard let url = url else {print("ERROR: Wrong url"); return nil}

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("RESPONSE:", response)
            return data
        } catch {print("ERROR: \(error)"); return nil}
    }
    static func decode<T: Codable>(_ what: T.Type, from data: Data) async -> T? {

        do {

            return try JSONDecoder().decode(what.self, from: data)
        } catch {print("ERROR: \(error): \(String(data: data, encoding: .ascii) ?? "?")"); return nil}
    }
    static func read<T: Codable>(_ what: T.Type, from file: String, type: String = "geojson") -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
            print("Wrong url"); return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Data decoding error"); return nil
        }
        guard let books = try? JSONDecoder().decode(T.self, from: data) else {
            print("Json decoding error"); return nil
        }
        return books
    }
}
