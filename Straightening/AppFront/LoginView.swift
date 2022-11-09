//
//  ViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import UIKit

class LoginView: UIViewController {
    
    private let logo: (stack: UIStackView, label: UILabel) = {
        
        let label = UILabel()
        
        return (stack: UIStackView(arrangedSubviews: [label]), label: label)
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemGreen.cgColor, UIColor.systemGreen.cgColor, UIColor.white.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(logo.stack)
        
        logo.stack.constraint(attributes_constants: [.top:100, .leading:30])
    }
}

