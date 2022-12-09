//
//  BookCollectionView.swift
//  Straightening
//
//  Created by Josicleison Elves on 03/09/1401 AP.
//

import UIKit

protocol BookCollectionViewDelegate: AnyObject {
    func collectionView(didSelectItemAt indexPath: IndexPath)
    func numberOfItemsInSection() -> Int
    func selectedChapter() -> Int
}

final class BookCollectionView: UICollectionView {
    weak var bookCollectionViewDelegate: BookCollectionViewDelegate?
    private let identifier = "Cell"
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        configure()
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        backgroundColor = Assets.Colors.whiteBlack
        register(BookCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        showsHorizontalScrollIndicator = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.isUserInteractionEnabled = false
        bookCollectionViewDelegate?.collectionView(didSelectItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookCollectionViewDelegate?.numberOfItemsInSection() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                      for: indexPath) as? BookCollectionViewCell
        cell?.label.text = "\(indexPath.row + 1)"
        if indexPath.row == bookCollectionViewDelegate?.selectedChapter() {
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
