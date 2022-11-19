//
//  BookCollectionViewCell.swift
//  Straightening
//
//  Created by Josicleison Elves on 28/08/1401 AP.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell, SetupView {
    lazy var label: UILabel = {
        let label = Create.label(font: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.backgroundColor = Assets.Colors.whiteBlack
        label.textColor = Assets.Colors.reverseDark
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                alternateColors(text: Assets.Colors.whiteBlack,
                                background: Assets.Colors.reverseDark)
            } else {
                alternateColors(text: Assets.Colors.reverseDark,
                                background: Assets.Colors.whiteBlack)
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
    func setupView() {
        contentView.addSubview(label)
    }
    func setupConstraints() {
        contentView.addConstraints([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
