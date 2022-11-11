//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, SetupView {
    private lazy var logo: (stack: UIStackView, label: UILabel) = {
        
        let label = UILabel()
        label.text = "Alistamento"
        label.textColor = .black
        
        let stack = UIStackView(arrangedSubviews: [label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return (stack: stack, label: label)
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrains()
    }
    
    private func gradientView() {
        
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor, UIColor.white.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
     func setupView() {
        gradientView()
        view.addSubviews([logo.stack])

    }

    
    
    
    
     func setupConstrains() {
        
        
        NSLayoutConstraint.activate([
        
          
            logo.stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logo.stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        
        
        
        
        
        ])
        
        
    }
}


