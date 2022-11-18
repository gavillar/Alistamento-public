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
    func updateLabel() {
        
        guard let verses = Network.read(Bible.self, from: "Bible")?.chapters.first?.verses else {return}
        
        delegate?.updateLabel(text: "\(verses.first?.number ?? 0): \(verses.first?.text ?? "")\n")
        for counter in 1...verses.count - 1 {
            delegate?.updateLabel(text: "\n\(verses[counter].number ?? 0): \(verses[counter].text ?? "")\n")
        }
        
//        Task {
//            guard let data = await Network.call(
//                from: "https://www.abibliadigital.com.br/api/verses/nvi/gn/1"
//            ) else {return}
//            guard let verses = Network.decode(Bible.self, from: data)?.verses else {return}
//            delegate?.updateLabel(text: "\(verses.first?.number ?? 0): \(verses.first?.text ?? "")\n")
//            for counter in 1...verses.count - 1 {
//                delegate?.updateLabel(text: "\n\(verses[counter].number ?? 0): \(verses[counter].text ?? "")\n")
//            }
//        }
    }
}
