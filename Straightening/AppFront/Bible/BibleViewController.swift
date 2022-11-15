//
//  BibleViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 21/08/1401 AP.
//

import UIKit

class BibleViewController: UIViewController, SetupView {
    
    private var texts = ["AAAAAA","\n\nAAAABAAAA\na","a\na\na\na\na","aaa\n\naa","aa\n\n\nCaa","aaaaa"]
    
    private lazy var search: (stack: UIStackView, textField: UITextField) = {
        let textField = Create.textField(textColor: .black)
        let action = UIAction {_ in
            if textField.text == "" {
                self.scroll.reloadData(self.texts); return
            } else {
                var texts:[String] = []
                for text in self.texts where text.contains(textField.text ?? "") {
                    texts.append(text)
                }
                self.scroll.reloadData(texts)
            }
        }
        textField.addAction(action, for: .editingChanged)
        let stack = UIStackView(arrangedSubviews: [textField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return (stack: stack, textField: textField)
    }()
    private lazy var scroll: (view: UIScrollView, reloadData: ([String]) -> Void) = {
        let stackView = UIStackView()
        let reloadData = {(texts: [String]) in
            var labels = [UILabel]()
            stackView.removeSubviews()
            for text in texts {
                let label = Create.label(text, font: UIFont.systemFont(ofSize: 20))
                label.numberOfLines = 0
                labels.append(label)
            }
            stackView.addArrangedSubviews(labels)
        }
        reloadData(self.texts)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        stackView.spacing = 50
        stackView.axis = .vertical
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        scrollView.addConstraints([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        return (view: scrollView, reloadData: reloadData)
    }()
    override func loadView() {
        super.loadView()
        title = "Bible"
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        Task {
            guard let data = await Network.call(from: "https://www.abibliadigital.com.br/api/books/") else {return}
            guard let books = Network.decode([Book].self, from: data) else {return}
            
            for book in books {
                guard let abbrev = book.abbrev?.pt else {return}
                guard let data = await Network.call(
                    from: "https://www.abibliadigital.com.br/api/books/\(abbrev)"
                ) else {return}
                guard let bookDetail = Network.decode(BookDetail.self, from: data) else {return}
                print(bookDetail)
                if let author = bookDetail.author {
                    texts.append(author)
                    self.scroll.reloadData(texts)
                }
            }
        }
    }
    func setupView() {
        view.addSubviews([search.stack, scroll.view])
    }
    func setupConstraints() {
        view.addConstraints([
            search.stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            search.stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            search.stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.view.topAnchor.constraint(equalTo: search.stack.bottomAnchor),
            scroll.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scroll.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.view.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ])
    }
}
