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
    init(_ book: Book?, detail: Detail?) {
        self.bookViewModel = BookViewModel(book, detail: detail)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - overrides
    override func loadView() {
        super.loadView()
        configute()
    }
// MARK: - funcs
    private func configute() {
        bookViewModel.delegate = self
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
        return bookViewModel.numberOfChapters
    }
    func selectedChapter() -> Int {
        return bookViewModel.displayingChapter
    }
}
