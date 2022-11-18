//
//  IntroViewController.swift
//  Straightening
//
//  Created by user220831 on 11/16/22.
//

import Foundation
import UIKit

class IntroViewController: UIViewController, SetupView {
    
    let loginviewcontroller = LoginViewController()
    let booksviewcontroller = BooksViewController()
    
    private lazy var straighteningButton = Create.baseButton("Alistamento", titleColor: .black, backgroundColor: Assets.Colors.green, for: .touchUpInside) {_ in
//            self.navigationController?.pushViewController(self.loginviewcontroller, animated: true)
//        self.navigationController?.pushViewController(self.loginviewcontroller, animated: true)
        self.navigationController?.navigate(to: self.loginviewcontroller)
    }
    
    private lazy var bibleButton = Create.baseButton("Biblía Sagrada", titleColor: .black, backgroundColor: Assets.Colors.green, for: .touchUpInside, handler: {_ in
//            self.navigationController?.pushViewController(self.booksviewcontroller, animated: true)
        self.navigationController?.navigate(to: self.booksviewcontroller)
    })
    
    private lazy var verseLabel = Create.label("Versículo do dia.", font: nil)
    
    private lazy var verseDayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "O cavalo prepara-se para o dia da batalha, mas a vitória vem do SENHOR.\n\nProvérbios 21:31 ARA"
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
    }
    
    func setupView() {
        view.backgroundColor = .darkGray
        verseDayLabel.textColor = .white
        view.addSubviews([straighteningButton, bibleButton, verseLabel, verseDayLabel])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            straighteningButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            straighteningButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            straighteningButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            verseLabel.topAnchor.constraint(equalTo: straighteningButton.bottomAnchor, constant: 50),
            verseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            verseDayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verseDayLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verseDayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            verseDayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            bibleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            bibleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bibleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
        
            
        
        ])
        
    }
    
}
