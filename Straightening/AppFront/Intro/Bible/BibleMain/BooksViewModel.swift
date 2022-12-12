//
//  BooksViewModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

final class BooksViewModel {
    var details: Details?
    var numberOfBooks: Int {self.details?.count ?? 0}
    lazy var detail = {(index: Int) -> Detail in
        return self.details?[index] ?? Detail()
    }
    func getBooks() {
        guard let details = Network.read(Details.self, from: "Books") else {return}
        self.details = details
    }
}
