//
//  IntroViewController.swift
//  Straightening
//
//  Created by user220831 on 11/16/22.
//

import UIKit

class IntroViewController: UIViewController {
// MARK: - variables
    let loginviewcontroller = LoginViewController()
    let booksviewcontroller = BooksViewController()
    private lazy var introView = IntroView(frame: view.frame)
// MARK: - overrides
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        introView.straighteningButton.addAction(UIAction(handler: straighteningButtonHandler), for: .touchUpInside)
        introView.bibleButton.addAction(UIAction(handler: bibleButtonHandler), for: .touchUpInside)
        introView.verseDayLabel.text = Network.read([String].self, from: "Verses")?.randomElement()
        view = introView
    }
// MARK: - funcs
    private func straighteningButtonHandler(_ action: UIAction) {
        navigationController?.navigate(to: loginviewcontroller)
    }
    private func bibleButtonHandler(_ action: UIAction) {
        navigationController?.navigate(to: self.booksviewcontroller)
    }
}
