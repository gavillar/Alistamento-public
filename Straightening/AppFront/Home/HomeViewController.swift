//
//  HomeViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    private lazy var ScrollView: UIScrollView = {
        let scroll = UIScrollView()
        let stackview = scroll.turnIntoAList(of: [homeView])
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = Create.labelTitle("Bem Vindo Jacaré")
        return label
    }()
    private lazy var homeView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    override func loadView() {
        super.loadView()
        view.addSubview(ScrollView)
        homeView.addSubviews([welcomeLabel])
        setupConstraints()
        view.layer.addGradientBackground()
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.navigationBar.isHidden = true
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            ScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            homeView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: homeView.topAnchor,constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: homeView.leadingAnchor,constant: 12),
            welcomeLabel.trailingAnchor.constraint(equalTo: homeView.trailingAnchor,constant: 12),
            
        ])
    }
}
