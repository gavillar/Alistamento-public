//
//  BooksViewModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

final class BooksViewModel {
    private var details: Details?
    var numberOfBooks: Int {self.details?.count ?? 0}
    lazy var detail = {(index: Int) -> Detail? in
        return self.details?[index]
    }
    lazy var book = {(index: Int) -> Book? in
        return Network.read(Books.self, from: "Bible")?[index]
    }
    func getBooks() {
        guard let details = Network.read(Details.self, from: "Sumary") else {return}
        self.details = details
    }
}
