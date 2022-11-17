//
//  BookViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class BookViewController: UIViewController, SetupView {
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "aaa\ns\nd\na\nsdq\nwea\nsd\nxcx\ncvxc\ncvxc\ncvxc\ncvxc\ncvxc\ncvxc\ncvxc\ncvxc"
        textView.textColor = Assets.Colors.reverseDark
        textView.font = Assets.font(50)
        return textView
    }()
    override func loadView() {
        super.loadView()
        setup()
    }
    func setupView() {
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubview(textView)
    }
    func setupConstraints() {
        view.addConstraints([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
