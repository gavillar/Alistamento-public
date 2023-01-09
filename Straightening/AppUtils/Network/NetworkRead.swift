//
//  NetworkRead.swift
//  Straightening
//
//  Created by Josicleison Elves on 28/12/22.
//

import Foundation

extension Network {
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
