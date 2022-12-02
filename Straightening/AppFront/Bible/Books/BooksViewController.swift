//
//  ViewController.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import UIKit

final class BooksViewController: UIViewController {
// MARK: - variables
    private lazy var booksviewmodel = BooksViewModel()
    private lazy var booksView = BooksView(frame: view.frame)
// MARK: - overrides
    override var prefersStatusBarHidden: Bool {false}
    override func loadView() {
        super.loadView()
        title = "Bíblia Digital"
        booksviewmodel.booksviewmodeldelegate = self
        booksView.collectionView.booksViewCollectionDelegate = self
        booksviewmodel.getBooks()
        view = booksView
    }
}

extension BooksViewController: BooksViewModelDelegate {
    func sendBooksElements(data: BooksElements) {
        Task {[weak self] in
            self?.booksviewmodel.books = data
        }
    }
    func sendBooksQuantity(data: Books) {
        Task {[weak self] in
            self?.booksView.collectionView.reloadData()
        }
    }
}

extension BooksViewController: BooksViewCollectionDelegate {
    func collectionView(didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(BookViewController(booksviewmodel.book(indexPath.row)),
                                                 animated: true)
    }
    func numberOfItemsInSection() -> Int {
        return self.booksviewmodel.count
    }
    func collectionView(_ cell: BooksCollectionCell, forItemAt indexPath: IndexPath) {
        cell.showData(data: self.booksviewmodel.booksData[indexPath.row])
    }
}
