//
//  BooksView.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

class BooksView: UIView {
// MARK: - variables
    private lazy var backgroundViewCollection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    lazy var collectionView: BooksViewCollection = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (frame.size.width/3)-4,
                                 height: (frame.size.width/1.7)-4)
        let collectionView = BooksViewCollection(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
// MARK: - overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - setup
    func configure() {
        backgroundColor = Assets.Colors.whiteBlack
        addSubview(collectionView)
    }
    func constrain() {
        addConstraints([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
