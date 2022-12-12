//
//  BooksModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

typealias Details = [Detail]

// MARK: - BooksElements
struct Detail: Codable {
    let abbrev: Abbrev?
    let group, name, testament, author: String?
    let chapters: Int?
    init() {
        abbrev = nil
        group = nil
        name = nil
        testament = nil
        author = nil
        chapters = nil
    }
}

// MARK: - Abbrev
struct Abbrev: Codable {
    let pt, en: String?
}
