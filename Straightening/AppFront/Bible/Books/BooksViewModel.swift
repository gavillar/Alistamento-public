//
//  BooksViewModel.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation

protocol BooksViewModelProtocol {
    func sendBooksQuantity(data: Books)
    func sendBooksElements(data: BooksElements)
   
}

class BooksViewModel {
    
    var booksviewmodeldelegate: BooksViewModelProtocol?
    var booksData = [BooksElements]()
    var books: BooksElements?
    
    //MARK: - count
    var count: Int {
        return self.booksData.count
    }
    
    func getBooks(completion: @escaping (Books) -> Void) {
        Task {[weak self] in
            guard let data = await Network.call(from: "https://www.abibliadigital.com.br/api/books") else {return}
            guard let books = Network.decode(Books.self, from: data) else {return}
            self?.booksviewmodeldelegate?.sendBooksQuantity(data: books)
        }
    }
}
    
    
    
