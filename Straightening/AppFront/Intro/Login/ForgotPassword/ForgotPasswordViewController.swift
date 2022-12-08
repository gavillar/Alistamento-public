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
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.layer.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        view = forgotPasswordView
        configure()
    }
// MARK: - funcs
    private func configure() {
        forgotPasswordView.sendButton.addTarget(nil, action: #selector(tryAgainButtonTarget),
                                                    for: .touchUpInside)
    }
    @objc private func tryAgainButtonTarget() {
        navigationController?.popViewController(animated: true)
    }
}
