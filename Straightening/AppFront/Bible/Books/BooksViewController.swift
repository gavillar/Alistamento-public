//
//  ViewController.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import UIKit

final class BooksViewController: UIViewController, SetupView {
    private let booksviewmodel = BooksViewModel()
// MARK: - prefersStatusBarHidden
    override var prefersStatusBarHidden: Bool {
        false
    }
// MARK: - backgroundViewCollection
    private lazy var backgroundViewCollection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
// MARK: - moviesCollection
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/1.7)-4)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BooksCollectionCell.self, forCellWithReuseIdentifier: BooksCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = Assets.Colors.weakWhiteBlack
        return collectionView
    }()
// MARK: - loadView
    override func loadView() {
        super.loadView()
        setup()
        booksviewmodel.booksviewmodeldelegate = self
        booksviewmodel.getBooks()
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
extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(BookViewController(booksviewmodel.book(indexPath.row)), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.booksviewmodel.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "booksCollectionCell",
                                                      for: indexPath) as? BooksCollectionCell
        Task {
            cell?.showData(data: self.booksviewmodel.booksData[indexPath.row])
        }
        return cell ?? UICollectionViewCell()
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
            self?.booksviewmodel.booksData = data
            self?.collectionView.reloadData()
        }
    }
}
