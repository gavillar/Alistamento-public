//
//  BookViewController.swift
//  Straightening
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class BookViewController: UIViewController, SetupView {
    
    let bookViewModel = BookViewModel()
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
    private lazy var controlCollection: (view: UICollectionView, cellIdentifier: String) = {
        let identifier = "Cell"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let controlCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        controlCollectionView.translatesAutoresizingMaskIntoConstraints = false
        controlCollectionView.delegate = self
        controlCollectionView.dataSource = self
        controlCollectionView.backgroundColor = Assets.Colors.whiteBlack
        controlCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        controlCollectionView.showsHorizontalScrollIndicator = false
        return (view: controlCollectionView, cellIdentifier: identifier)
    }()
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        controlCollection.view.removeFromSuperview()
    }
    override func loadView() {
        super.loadView()
        setup()
        bookViewModel.delegate = self
        bookViewModel.updateBook()
        bookViewModel.updateLabel()
    }
    func setupView() {
        view.backgroundColor = Assets.Colors.whiteBlack
        view.addSubview(text.scroll)
        navigationController?.navigationBar.addSubview(controlCollection.view)
    }
    func setupConstraints() {
        view.addConstraints([
            text.scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            text.scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            text.scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            text.scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        guard let navigationBar = navigationController?.navigationBar else {return}
        [
            controlCollection.view.topAnchor.constraint(equalTo: navigationBar.topAnchor),
            controlCollection.view.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            controlCollection.view.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            controlCollection.view.widthAnchor.constraint(equalToConstant: navigationBar.frame.width*0.5)
        ].forEach {$0.isActive = true}
    }
}
extension BookViewController: BookViewModelDelegate {
    func updateLabel(text: String) {
        Task {[weak self] in
            self?.text.label.text?.append(text)
        }
    }
}
extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        text.label.text = ""
        bookViewModel.updateLabel(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookViewModel.chapters
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: controlCollection.cellIdentifier,
                                                      for: indexPath)
        let label = Create.label("\(indexPath.row + 1)", font: UIFont.systemFont(ofSize: 20, weight: .bold))
        cell.contentView.addSubview(label)
        cell.contentView.addConstraints([
            label.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: navigationController?.navigationBar.frame.height ?? 0,
                      height: navigationController?.navigationBar.frame.height ?? 0)
    }
}
