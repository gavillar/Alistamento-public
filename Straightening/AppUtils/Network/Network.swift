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
    static func decode<T: Codable>(_ model: T.Type, from data: Data) async -> T? {

        do {

            return try JSONDecoder().decode(model.self, from: data)
        } catch {print("ERROR: \(error): \(String(data: data, encoding: .ascii) ?? "?")"); return nil}
    }
    static func read<T: Codable>(_ what: T.Type, from file: String, type: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
            print("ERROR: File not found"); return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("ERROR: Unable to assign data"); return nil
        }
        guard let model = try? JSONDecoder().decode(T.self, from: data) else {
            print("ERROR: Could not decode file"); return nil
        }
        return model
    }
}
