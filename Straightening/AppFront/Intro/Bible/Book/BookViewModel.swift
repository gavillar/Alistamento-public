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
    private var bible: (book: Book?, detail: Detail?)
    init(_ book: Book?, detail: Detail?) {
        self.bible = (book: book, detail: detail)
    }
    var displayingChapter: Int = 0
    var numberOfChapters: Int {
        return bible.detail?.chapters ?? 0
    }
    var title: String {
        return bible.detail?.name ?? ""
    }
    func updateLabel(_ index: Int = 0) {
        if let chapters = bible.book?.chapters, !chapters.isEmpty {
            let chapter = chapters[index]
            delegate?.updateLabel(text: "1: \(chapter.first ?? "")\n")
            for counter in 1...chapter.count - 1 {
                delegate?.updateLabel(text: "\n\(counter + 1): \(chapter[counter])\n")
            }
            displayingChapter = index
            delegate?.unfreezeCollection()
        }
    }
}
