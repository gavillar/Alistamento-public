//
//  BooksModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

// MARK: - BooksElements
struct BooksElements: Codable {
    let abbrev: Abbrev?
    let author: String?
    let chapters: Int
    let group, name: String?
    let testament: Testament?
    let results: [BooksElements]?
}

// MARK: - Abbrev
struct Abbrev: Codable {
    let pt, en: String?
}

enum Testament: String, Codable {
    case nt = "NT"
    case vt = "VT"
}

typealias Books = [BooksElements]
