//
//  BookViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class BookViewController: UIViewController, SetupView {
    private let bookViewModel: BookViewModel
    init(_ booksElements: BooksElements) {
        self.bookViewModel = BookViewModel(booksElements)
        super.init(nibName: nil, bundle: nil)
        bookViewModel.delegate = self
        bookViewModel.updateBook()
        bookViewModel.updateLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var text: (label: UILabel, scroll: UIScrollView) = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(label)
        scroll.addConstraints([
            label.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scroll.contentLayoutGuide.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor),
            label.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor)
        ])
        return (label: label, scroll: scroll)
    }()
    private lazy var bookCollectionView: BookCollectionView = {
        let bookCollectionView = BookCollectionView()
        bookCollectionView.bookCollectionViewDelegate = self
        return bookCollectionView
    }()
    override func loadView() {
        super.loadView()
        setup()
        title = bookViewModel.title
    }
    func setupView() {
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubviews([bookCollectionView, text.scroll])
    }
    func setupConstraints() {
        view.addConstraints([
            bookCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bookCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bookCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width*0.1),
            text.scroll.topAnchor.constraint(equalTo: bookCollectionView.bottomAnchor),
            text.scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            text.scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            text.scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension BookViewController: BookViewModelDelegate {
    func unfreezeCollection() {
        bookCollectionView.isUserInteractionEnabled = true
    }
    func updateLabel(text: String) {
        Task {[weak self] in
            self?.text.label.text?.append(text)
        }
    }
}

extension BookViewController: BookCollectionViewDelegate {
    func updateLabel(_ indexPath: IndexPath) {
        text.label.text = ""
        bookViewModel.updateLabel(indexPath.row)
    }
    func countChapters() -> Int {
        return bookViewModel.chapters
    }
    func verifyChapter() -> Int {
        return bookViewModel.chapter
    }
}
