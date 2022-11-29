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
        
        for ch in formatMask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    func clearFormatMask() -> String{
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
