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
        let stackview = scroll.turnIntoAList(view: homeView)
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
        let button = Create.baseButton("Versiculos Marcados")
        button.addUnderline()
        return button
    }()
    private lazy var noteButton: UIButton = {
        let button = Create.baseButton("Anotações")
        button.addUnderline()
        return button
    }()
    private lazy var configButton: UIButton = {
        let button = Create.baseButton("Configurações")
        button.addUnderline()
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
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        view.layer.addGradientBackground(frame: CGRect(origin: .zero, size: size))
    }
    override func loadView() {
        super.loadView()
        configure()
    }
    private func configure() {
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
            bibleImage.topAnchor.constraint(equalTo: homeView.topAnchor),
            bibleImage.leadingAnchor.constraint(equalTo: homeView.leadingAnchor),
            bibleImage.trailingAnchor.constraint(equalTo: homeView.trailingAnchor),
            bibleImage.heightAnchor.constraint(equalToConstant: view.frame.height*0.5),
            welcomeLabel.centerXAnchor.constraint(equalTo: bibleImage.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: bibleImage.topAnchor,
                                              constant: view.frame.height*0.005),
            markButton.topAnchor.constraint(equalTo: bibleImage.bottomAnchor,
                                            constant: view.frame.height*0.02),
            markButton.leadingAnchor.constraint(equalTo: homeView.leadingAnchor,
                                                constant: view.frame.width*0.02),
            markButton.trailingAnchor.constraint(equalTo: homeView.trailingAnchor,
                                                 constant: -view.frame.width*0.02),
            noteButton.topAnchor.constraint(equalTo: markButton.bottomAnchor,
                                            constant: view.frame.height*0.01),
            noteButton.leadingAnchor.constraint(equalTo: markButton.leadingAnchor),
            noteButton.trailingAnchor.constraint(equalTo: markButton.trailingAnchor),
            configButton.topAnchor.constraint(equalTo: noteButton.bottomAnchor,
                                              constant: view.frame.height*0.01),
            configButton.leadingAnchor.constraint(equalTo: markButton.leadingAnchor),
            configButton.trailingAnchor.constraint(equalTo: markButton.trailingAnchor),
            configButton.bottomAnchor.constraint(equalTo: homeView.bottomAnchor)
        ])
    }
}
