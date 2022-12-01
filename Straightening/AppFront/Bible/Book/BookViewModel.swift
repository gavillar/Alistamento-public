//
//  BookViewModel.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import Foundation

protocol BookViewModelDelegate: AnyObject {
    func updateLabel(text: String)
    func unfreezeCollection()
}

final class BookViewModel {
    weak var delegate: BookViewModelDelegate?
    private var bible: (book: Bible?, details: BooksElements)?
    init(_ booksElements: BooksElements) {
        self.bible = (book: nil, details: booksElements)
    }
    var chapter: Int = 0
    var chapters: Int {
        return bible?.book?.chapters.count ?? 0
    }
    var title: String {
        return bible?.details.name ?? ""
    }
    func updateBook() {
        let name = self.bible?.details.name ?? ""
        self.bible?.book = Network.read(Bible.self, from: name)
    }
    func updateLabel(_ chapter: Int = 0) {
        guard let verses = bible?.book?.chapters[chapter].verses else {return}
        delegate?.updateLabel(text: "\(verses.first?.number ?? 0): \(verses.first?.text ?? "")\n")
        for counter in 1...verses.count - 1 {
            delegate?.updateLabel(text: "\n\(verses[counter].number ?? 0): \(verses[counter].text ?? "")\n")
        }
        self.chapter = chapter
        delegate?.unfreezeCollection()
    }
}
