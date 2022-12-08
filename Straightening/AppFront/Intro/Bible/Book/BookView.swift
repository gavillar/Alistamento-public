//
//  BookView.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

class BookView: UIView {
// MARK: - variables
    lazy var versesLabel: UILabel = {
        let versesLabel = UILabel()
        versesLabel.text = ""
        versesLabel.numberOfLines = 0
        return versesLabel
    }()
    lazy var bookCollectionView: BookCollectionView = {
        let bookCollectionView = BookCollectionView()
        return bookCollectionView
    }()
    private lazy var versesScroll: UIScrollView = {
        let versesScroll = UIScrollView()
        versesScroll.translatesAutoresizingMaskIntoConstraints = false
        versesScroll.turnIntoAList(of: [versesLabel])
        return versesScroll
    }()
// MARK: - overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - setup
    func setupView() {
        backgroundColor = Assets.Colors.whiteBlack
        addSubviews([bookCollectionView, versesScroll])
    }
    func setupConstraints() {
        addConstraints([
            bookCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bookCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bookCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bookCollectionView.heightAnchor.constraint(equalToConstant: frame.width*0.1),
            versesScroll.topAnchor.constraint(equalTo: bookCollectionView.bottomAnchor),
            versesScroll.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            versesScroll.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            versesScroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
