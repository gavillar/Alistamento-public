//
//  IntroViewController.swift
//  Straightening
//
//  Created by user220831 on 11/16/22.
//

import UIKit


class IntroViewController: UIViewController, SetupView {
// MARK: - variables
    let loginviewcontroller = LoginViewController()
    let booksviewcontroller = BooksViewController()
    let function = VerseManager()
    private lazy var straighteningButton = Create.baseButton("Alistamento", titleColor: .black,
                                                             backgroundColor: Assets.Colors.whiteBlack) {_ in
        self.navigationController?.navigate(to: self.loginviewcontroller)
    }
    private lazy var bibleButton = Create.baseButton("Biblía Sagrada", titleColor: .black,
                                                     backgroundColor: Assets.Colors.whiteBlack) {_ in
        self.navigationController?.navigate(to: self.booksviewcontroller)
    }
    private lazy var verseLabel = Create.label("Versículos Bíblicos.", font: UIFont.boldSystemFont(ofSize: 25))
    private lazy var verseDayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = function.randomVerse(Network.read([String].self, from: "Verses") ?? [])
        return label
    }()
// MARK: - overrides
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.defaultBackground()
    }
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - setup
    func setupView() {
        verseDayLabel.textColor = .white
        view.addSubviews([straighteningButton, bibleButton, verseLabel, verseDayLabel])
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            straighteningButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                     constant: view.frame.height*0.1),
            straighteningButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            straighteningButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            verseLabel.topAnchor.constraint(equalTo: straighteningButton.bottomAnchor,
                                            constant: view.frame.height*0.1),
            verseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                constant: view.frame.height*0.05),
            verseDayLabel.topAnchor.constraint(equalTo: verseLabel.bottomAnchor, constant: 20),
            verseDayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                   constant: view.frame.height*0.05),
            verseDayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -view.frame.height*0.05),
            bibleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                constant: -view.frame.height*0.1),
            bibleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bibleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
