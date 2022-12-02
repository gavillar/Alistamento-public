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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var versesLabel: UILabel = {
        let versesLabel = UILabel()
        versesLabel.text = ""
        versesLabel.numberOfLines = 0
        return versesLabel
    }()
    private lazy var versesScroll: UIScrollView = {
        let versesScroll = UIScrollView()
        versesScroll.translatesAutoresizingMaskIntoConstraints = false
        versesScroll.turnIntoAList(of: [versesLabel])
        return versesScroll
    }()
    private lazy var bookCollectionView: BookCollectionView = {
        let bookCollectionView = BookCollectionView()
        bookCollectionView.bookCollectionViewDelegate = self
        return bookCollectionView
    }()
// MARK: - init
    init(_ booksElements: BooksElements) {
        self.bookViewModel = BookViewModel(booksElements)
        super.init(nibName: nil, bundle: nil)
        bookViewModel.delegate = self
        bookViewModel.updateBook()
        bookViewModel.updateLabel()
    }
// MARK: - overrides
    override func loadView() {
        super.loadView()
        setupView()
        setupConstraints()
    }
// MARK: - setup
    func setupView() {
        title = bookViewModel.title
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubviews([bookCollectionView, versesScroll])
    }
    func setupConstraints() {
        view.addConstraints([
            bookCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bookCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bookCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width*0.1),
            versesScroll.topAnchor.constraint(equalTo: bookCollectionView.bottomAnchor),
            versesScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            versesScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            versesScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension BookViewController: BookViewModelDelegate {
    func unfreezeCollection() {
        bookCollectionView.isUserInteractionEnabled = true
    }
    func updateLabel(text: String) {
        Task {[weak self] in
            self?.versesLabel.text?.append(text)
        }
    }
}

extension BookViewController: BookCollectionViewDelegate {
    func collectionView(didSelectItemAt indexPath: IndexPath) {
        versesLabel.text = ""
        bookViewModel.updateLabel(indexPath.row)
    }
    func numberOfItemsInSection() -> Int {
        return bookViewModel.chapters
    }
    func selectedChapter() -> Int {
        return bookViewModel.chapter
    }
}
