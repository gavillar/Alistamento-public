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
    private lazy var straighteningButton = Create.baseButton("ALISTAMENTO") {_ in
        self.navigationController?.navigate(to: LoginWithEmail())
    }
    private lazy var bibleScrollView: UIScrollView = {
        let verseLabel = Create.label("Versículos Bíblicos.", font: UIFont.boldSystemFont(ofSize: 25))
        verseLabel.textAlignment = .left
        let verseDayLabel = UILabel()
        verseDayLabel.textColor = .white
        verseDayLabel.numberOfLines = 0
        verseDayLabel.font = UIFont.boldSystemFont(ofSize: 15)
        verseDayLabel.text = Network.read([String].self, from: "Verses")?.randomElement()
        let bibleScrollView = UIScrollView()
        bibleScrollView.translatesAutoresizingMaskIntoConstraints = false
        bibleScrollView.turnIntoAList(of: [verseLabel, verseDayLabel])
            .spacing = view.frame.height*0.05
        return bibleScrollView
    }()
    private lazy var bibleButton = Create.baseButton("BÍBLIA SAGRADA") {_ in
        self.navigationController?.navigate(to: self.booksviewcontroller)
    }
// MARK: - overrides
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        setup()
    }
// MARK: - setup
    func setupView() {
        view.addSubviews([straighteningButton, bibleButton, bibleScrollView])
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            straighteningButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            straighteningButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            straighteningButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bibleScrollView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            bibleScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                     constant: view.frame.width*0.05),
            bibleScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: -view.frame.width*0.05),
            bibleScrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                                    multiplier: 0.6),
            bibleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bibleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bibleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                constant: -view.frame.height*0.05)
        ])
    }
}
