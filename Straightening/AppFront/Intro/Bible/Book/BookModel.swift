//
//  BookModel.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import Foundation

typealias Books = [Book]

struct Book: Codable {
    let abbrev, name: String?
    let chapters: [[String]]?
}
