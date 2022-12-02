//
//  IntroView.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

class IntroView: UIView {
    lazy var verseDayLabel: UILabel = {
        let verseDayLabel = UILabel()
        verseDayLabel.textColor = .white
        verseDayLabel.numberOfLines = 0
        verseDayLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return verseDayLabel
    }()
    private lazy var bibleScrollView: UIScrollView = {
        let verseLabel = Create.label("Versículos Bíblicos.", font: UIFont.boldSystemFont(ofSize: 25))
        verseLabel.textAlignment = .left
        let bibleScrollView = UIScrollView()
        bibleScrollView.translatesAutoresizingMaskIntoConstraints = false
        bibleScrollView.turnIntoAList(of: [verseLabel, verseDayLabel])
            .spacing = frame.height*0.05
        return bibleScrollView
    }()
    lazy var straighteningButton = Create.baseButton("ALISTAMENTO")
    lazy var bibleButton = Create.baseButton("BÍBLIA SAGRADA")
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - Setup
    func setupView() {
        addSubviews([straighteningButton, bibleButton, bibleScrollView])
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            straighteningButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            straighteningButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            straighteningButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bibleScrollView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            bibleScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                     constant: frame.width*0.05),
            bibleScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -frame.width*0.05),
            bibleScrollView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor,
                                                    multiplier: 0.6),
            bibleButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bibleButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bibleButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                constant: -frame.height*0.05)
        ])
    }
}
