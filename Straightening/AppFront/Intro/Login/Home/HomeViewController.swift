//
//  HomeViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        let stackview = scroll.turnIntoAList(of: [homeView])
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    private lazy var welcomeLabel: UILabel = {
        let label = Create.labelTitle("Bem Vindo a \n Bíblia Sagrada Jacaré")
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private lazy var markButton: UIButton = {
        let button = Create.button()
        button.setTitle("Versiculos Marcados", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        return button
    }()
    private lazy var noteButton: UIButton = {
        let button = Create.button()
        button.setTitle("Anotações", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        return button
    }()
    private lazy var configButton: UIButton = {
        let button = Create.button()
        button.setTitle("Configurações", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        return button
    }()
    private lazy var homeView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var bibleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HomeImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    override func loadView() {
        super.loadView()
        view.addSubview(scrollView)
        homeView.addSubviews([bibleImage,
                              welcomeLabel,
                              markButton,
                              noteButton,
                              configButton])
        setupConstraints()
        view.layer.addGradientBackground(frame: view.frame)
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeView.heightAnchor.constraint(equalTo: view.heightAnchor),
            bibleImage.topAnchor.constraint(equalTo: homeView.topAnchor),
            bibleImage.leadingAnchor.constraint(equalTo: homeView.leadingAnchor),
            bibleImage.trailingAnchor.constraint(equalTo: homeView.trailingAnchor),
            bibleImage.heightAnchor.constraint(equalTo: homeView.heightAnchor,
                                               multiplier: 0.20),
            welcomeLabel.centerXAnchor.constraint(equalTo: bibleImage.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: bibleImage.topAnchor,
                                              constant: 2),
            markButton.topAnchor.constraint(equalTo: bibleImage.bottomAnchor,
                                            constant: 20),
            markButton.leadingAnchor.constraint(equalTo: homeView.leadingAnchor,
                                                constant: 20),
            markButton.trailingAnchor.constraint(equalTo: homeView.trailingAnchor,
                                                 constant: -20),
            noteButton.topAnchor.constraint(equalTo: markButton.bottomAnchor,
                                            constant: 12),
            noteButton.leadingAnchor.constraint(equalTo: markButton.leadingAnchor),
            noteButton.trailingAnchor.constraint(equalTo: markButton.trailingAnchor),
            configButton.topAnchor.constraint(equalTo: noteButton.bottomAnchor,
                                              constant: 12),
            configButton.leadingAnchor.constraint(equalTo: markButton.leadingAnchor),
            configButton.trailingAnchor.constraint(equalTo: markButton.trailingAnchor)
        ])
    }
}
