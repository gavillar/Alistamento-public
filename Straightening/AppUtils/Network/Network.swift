//
//  Network.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import Foundation

struct Network {
    static func call(from url: String?) async -> Data? {

        guard let url = URL(string: url ?? "") else {print("ERROR: Wrong url"); return nil}

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("RESPONSE:", response)
            return data
        } catch {print("ERROR: \(error)"); return nil}
    }
    static func decode<T: Codable>(_ what: T.Type, from data: Data) -> T? {

        do {

            return try JSONDecoder().decode(what.self, from: data)
        } catch {print("ERROR: \(error): \(String(data: data, encoding: .ascii) ?? "?")"); return nil}
    }
    static func read<T: Codable>(_ what: T.Type, from file: String, type: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
            print("bad url"); return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("bad data"); return nil
        }
        guard let books = try? JSONDecoder().decode(T.self, from: data) else {
            print("bad books"); return nil
        }
        return books
    }
}
