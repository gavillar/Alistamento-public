//
//  BookViewModel.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import Foundation

protocol BookViewModelDelegate: AnyObject {
    func updateLabel(text: String)
}

final class BookViewModel {
    weak var delegate: BookViewModelDelegate?
    var book: Bible? = nil
    var chapters: Int {
        return book?.chapters.count ?? 0
    }
    func updateBook() {
        self.book = Network.read(Bible.self, from: "Genesis")
    }
    func updateLabel(_ chapter: Int = 0) {
        guard let verses = book?.chapters[chapter].verses else {return}
        delegate?.updateLabel(text: "\(verses.first?.number ?? 0): \(verses.first?.text ?? "")\n")
        for counter in 1...verses.count - 1 {
            delegate?.updateLabel(text: "\n\(verses[counter].number ?? 0): \(verses[counter].text ?? "")\n")
        }
    }
}
