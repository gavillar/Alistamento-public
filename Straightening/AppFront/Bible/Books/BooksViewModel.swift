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
        
        guard let url = URL(string: "https://www.abibliadigital.com.br/api/books") else {return}
       
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in 
            if error == nil {
                print("not nil")
            }
                guard let data = data else {return}
                
                let result = try? JSONDecoder().decode(Books.self, from: data)
            print("status 200")
                
                guard let newResult = result else {return}
            
            self?.booksviewmodeldelegate?.sendBooksQuantity(data: newResult)
                
        }.resume()
    }
}
    
    
    
