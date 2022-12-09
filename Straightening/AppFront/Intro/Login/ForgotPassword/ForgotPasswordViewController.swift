//
//  LoginErrorViewController.swift
//  Straightening
//
//  Created by user220831 on 12/3/22.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
// MARK: - variables
    private lazy var forgotPasswordView = ForgotPasswordView(frame: view.frame)
// MARK: - overrides
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        view.layer.addGradientBackground(frame: CGRect(origin: .zero, size: size))
    }
    override func loadView() {
        super.loadView()
        configure()
    }
// MARK: - funcs
    private func configure() {
        view = forgotPasswordView
        forgotPasswordView.sendButton.addTarget(nil, action: #selector(tryAgainButtonTarget),
                                                    for: .touchUpInside)
    }
    @objc private func tryAgainButtonTarget() {
        navigationController?.popViewController(animated: true)
    }
}
