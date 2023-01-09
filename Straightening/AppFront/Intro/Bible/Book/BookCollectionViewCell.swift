//
//  BookCollectionViewCell.swift
//  Straightening
//
//  Created by Josicleison Elves on 28/08/1401 AP.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    lazy var label: UILabel = {
        let label = Create.label(font: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.backgroundColor = .whiteBlack
        label.textColor = .reverseDark
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constrain()
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                alternateColors(text: .whiteBlack,
                                background: .reverseDark)
            } else {
                alternateColors(text: .reverseDark,
                                background: .whiteBlack)
            }
        }
    }
    func alternateColors(text: UIColor?, background: UIColor?) {
        label.textColor = text
        label.backgroundColor = background
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        contentView.addSubview(label)
    }
    func constrain() {
        contentView.addConstraints([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
