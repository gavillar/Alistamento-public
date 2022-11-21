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
    private lazy var collection: (view: UICollectionView, cellIdentifier: String) = {
        let identifier = "Cell"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = Assets.Colors.whiteBlack
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return (view: collectionView, cellIdentifier: identifier)
    }()
    override func loadView() {
        super.loadView()
        setup()
        title = bookViewModel.title
        bookViewModel.delegate = self
        bookViewModel.updateBook()
        bookViewModel.updateLabel()
    }
    func setupView() {
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubviews([collection.view, text.scroll])
    }
    func setupConstraints() {
        view.addConstraints([
            collection.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.view.heightAnchor.constraint(equalToConstant: view.frame.width*0.1),
            text.scroll.topAnchor.constraint(equalTo: collection.view.bottomAnchor),
            text.scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            text.scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            text.scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension BookViewController: BookViewModelDelegate {
    func updateLabel(text: String) {
        Task {[weak self] in
            self?.text.label.text?.append(text)
        }
    }
}
extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        text.label.text = ""
        bookViewModel.updateLabel(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookViewModel.chapters
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collection.cellIdentifier,
                                                      for: indexPath) as? BookCollectionViewCell
        cell?.label.text = "\(indexPath.row + 1)"
        if indexPath.row == bookViewModel.selectedCell {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height,
                      height: collectionView.frame.height)
    }
}
