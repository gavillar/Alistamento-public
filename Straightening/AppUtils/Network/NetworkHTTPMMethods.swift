//
//  Network.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import Foundation

extension Network {
    static func get(from url: URL?) async -> Data? {

        guard let url = url else {print("ERROR: Wrong url"); return nil}

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("RESPONSE:", response)
            return data
        } catch {print("ERROR: \(error)"); return nil}
    }
}
