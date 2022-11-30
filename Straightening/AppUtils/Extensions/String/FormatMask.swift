//
//  FormatMask.swift
//  Straightening
//
//  Created by user220831 on 11/28/22.
//

import Foundation

extension String {
    func formatMask(_ formatMask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex
        for character in formatMask where startIndex < endIndex {
            if character == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(character)
            }
        }
        return result
    }
    func clearFormatMask() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
