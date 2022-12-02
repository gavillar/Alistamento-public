//
//  ViewController.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import UIKit

final class BooksViewController: UIViewController {
// MARK: - booksviewmodel
    private let booksviewmodel = BooksViewModel()
// MARK: - backgroundViewCollection
    private lazy var backgroundViewCollection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
// MARK: - moviesCollection
    private lazy var collectionView: BooksViewCollection = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/1.7)-4)
        let collectionView = BooksViewCollection(frame: .zero, collectionViewLayout: layout)
        collectionView.booksViewCollectionDelegate = self
        return collectionView
    }()
// MARK: - init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        booksviewmodel.booksviewmodeldelegate = self
        booksviewmodel.getBooks()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {false}
// MARK: - loadView
    override func loadView() {
        super.loadView()
        setupView()
        setupConstraints()
    }
// MARK: - setupView
    func setupView() {
        title = "Bíblia Digital"
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubview(collectionView)
    }
// MARK: - setupConstraints
    func setupConstraints() {
        view.addConstraints([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension BooksViewController: BooksViewModelProtocol {
    func sendBooksElements(data: BooksElements) {
        Task {[weak self] in
            self?.booksviewmodel.books = data
        }
    }
    func sendBooksQuantity(data: Books) {
        Task {[weak self] in
            self?.collectionView.reloadData()
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
