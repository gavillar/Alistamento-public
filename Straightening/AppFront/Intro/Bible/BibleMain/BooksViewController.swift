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
        configute()
    }
    private func configute() {
        title = "Bíblia Digital"
        booksView.collectionView.booksViewCollectionDelegate = self
        booksviewmodel.getBooks()
        view = booksView
    }
}

extension BooksViewController: BooksViewCollectionDelegate {
    func collectionView(didSelectItemAt indexPath: IndexPath) {
//        navigationController?.pushViewController(BookViewController(booksviewmodel.book(indexPath.row)),
//                                                 animated: true)
    }
    func numberOfItemsInSection() -> Int {
        return booksviewmodel.numberOfBooks
    }
    func collectionView(_ cell: BooksCollectionCell, forItemAt indexPath: IndexPath) {
        cell.setup(cell: booksviewmodel.detail(indexPath.row))
    }
}
