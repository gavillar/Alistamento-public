//
//  FunctionRandomVerse.swift
//  Straightening
//
//  Created by user220831 on 11/25/22.
//

import Foundation
import UIKit

class VerseManager {
    //This function is responsible for going through an array called Verses, and randomly choosing one to be displayed in the introview.
    func randomVerse(_ array: [String]) -> String {
        guard array.count > 0 else {return String()}
        let verse = array[Int.random(in: 0...array.count - 1)]
        return verse
    }
}
