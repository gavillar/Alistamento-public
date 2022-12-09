//
//  BooksViewCollection.swift
//  Straightening
//
//  Created by Josicleison Elves on 03/09/1401 AP.
//

import UIKit

protocol BooksViewCollectionDelegate: AnyObject {
    func collectionView(didSelectItemAt indexPath: IndexPath)
    func numberOfItemsInSection() -> Int
    func collectionView(_ cell: BooksCollectionCell, forItemAt indexPath: IndexPath)
}

final class BooksViewCollection: UICollectionView {
// MARK: - variables
    weak var booksViewCollectionDelegate: BooksViewCollectionDelegate?
// MARK: - overrides
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        register(BooksCollectionCell.self, forCellWithReuseIdentifier: BooksCollectionCell.identifier)
        delegate = self
        dataSource = self
        backgroundColor = Assets.Colors.weakWhiteBlack
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BooksViewCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        booksViewCollectionDelegate?.collectionView(didSelectItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksViewCollectionDelegate?.numberOfItemsInSection() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BooksCollectionCell.identifier,
            for: indexPath
        ) as? BooksCollectionCell else {return UICollectionViewCell()}
        Task {
            booksViewCollectionDelegate?.collectionView(cell, forItemAt: indexPath)
        }
        return cell
    }
}
