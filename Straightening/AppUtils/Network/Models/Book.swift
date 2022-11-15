//
//  Book.swift
//  Straightening
//
//  Created by Josicleison Elves on 23/08/1401 AP.
//

import Foundation

struct Book: Codable {
    let author, group, name, testament: String?
    let chapters: Int?
    let abbrev: Abbrev?
}
struct Abbrev: Codable {
    let pt, en: String?
}
