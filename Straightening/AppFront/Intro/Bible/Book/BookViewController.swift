//
//  BookViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class BookViewController: UIViewController {
// MARK: - variables
    private let bookViewModel: BookViewModel
    private lazy var bookView = BookView(frame: view.frame)
// MARK: - init
    init(_ booksElements: BooksElements) {
        self.bookViewModel = BookViewModel(booksElements)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - overrides
    override func loadView() {
        super.loadView()
        bookViewModel.delegate = self
        bookViewModel.updateBook()
        bookViewModel.updateLabel()
        bookView.bookCollectionView.bookCollectionViewDelegate = self
        view = bookView
        title = bookViewModel.title
    }
}

extension BookViewController: BookViewModelDelegate {
    func unfreezeCollection() {
        bookView.bookCollectionView.isUserInteractionEnabled = true
    }
    func updateLabel(text: String) {
        Task {[weak self] in
            self?.bookView.versesLabel.text?.append(text)
        }
    }
}

extension BookViewController: BookCollectionViewDelegate {
    func collectionView(didSelectItemAt indexPath: IndexPath) {
        bookView.versesLabel.text = ""
        bookViewModel.updateLabel(indexPath.row)
    }
    func numberOfItemsInSection() -> Int {
        return bookViewModel.chapters
    }
    func selectedChapter() -> Int {
        return bookViewModel.chapter
    }
}
