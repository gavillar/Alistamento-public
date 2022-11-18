//
//  BookViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class BookViewController: UIViewController, SetupView {
    private lazy var text: (label: UILabel, scroll: UIScrollView) = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(label)
        scroll.addConstraints([
            label.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scroll.contentLayoutGuide.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor),
            label.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor)
        ])
        return (label: label, scroll: scroll)
    }()
    override func loadView() {
        super.loadView()
        setup()
        let bookViewModel = BookViewModel()
        bookViewModel.delegate = self
        bookViewModel.updateLabel()
//        Task {[weak self] in
//            guard let data = await Network.call(
//                from: "https://www.abibliadigital.com.br/api/verses/nvi/gn/1"
//            ) else {return}
//            guard let verses = Network.decode(Bible.self, from: data)?.verses else {return}
//            self?.text.label.text?.append("\(verses.first?.number ?? 0): \(verses.first?.text ?? "")\n")
//            for counter in 1...verses.count - 1 {
//                self?.text.label.text?.append("\n\(verses[counter].number ?? 0): \(verses[counter].text ?? "")\n")
//            }
//        }
    }
    func setupView() {
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubview(text.scroll)
    }
    func setupConstraints() {
        view.addConstraints([
            text.scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            text.scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            text.scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            text.scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension BookViewController: BookViewModelDelegate {
    func updateLabel(text: String) {
        Task {[weak self] in
            self?.text.label.text?.append(text)
        }
    }
}
