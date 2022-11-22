//
//  BooksViewModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

protocol BooksViewModelProtocol: AnyObject {
    func sendBooksQuantity(data: Books)
    func sendBooksElements(data: BooksElements)
}

final class BooksViewModel {
    weak var booksviewmodeldelegate: BooksViewModelProtocol?
    var booksData = [BooksElements]()
    var books: BooksElements?
// MARK: - count
    var count: Int {
        return self.booksData.count
    }
    lazy var book = {(index: Int) -> BooksElements in
        return self.booksData[index]
    }
    func getBooks() {
        Task {
            guard let data = await Network.call(from: "https://www.abibliadigital.com.br/api/books") else {return}
            guard let books = Network.decode(Books.self, from: data) else {return}
            booksviewmodeldelegate?.sendBooksQuantity(data: books)
        }
    }
}
