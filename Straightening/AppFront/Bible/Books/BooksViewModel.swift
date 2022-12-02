//
//  BooksViewModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

protocol BooksViewModelDelegate: AnyObject {
    func sendBooksQuantity(data: Books)
    func sendBooksElements(data: BooksElements)
}

final class BooksViewModel {
    weak var booksviewmodeldelegate: BooksViewModelDelegate?
    var booksData = [BooksElements]()
    var books: BooksElements?
// MARK: - count
    var count: Int {self.booksData.count}
    lazy var book = {(index: Int) -> BooksElements in
        return self.booksData[index]
    }
    func getBooks() {
        guard let books = Network.read(Books.self, from: "Books") else {return}
        booksData = books
        booksviewmodeldelegate?.sendBooksQuantity(data: booksData)
    }
}
