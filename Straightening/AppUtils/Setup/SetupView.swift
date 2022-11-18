//
//  SetupView.swift
//  Straightening
//
//  Created by user220831 on 11/10/22.
//

protocol SetupView {
    func setupView()
    func setupConstraints()
    func setup()
}

extension SetupView {
    func setup() {
        setupView()
        setupConstraints()
    }
}
