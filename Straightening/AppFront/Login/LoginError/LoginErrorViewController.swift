//
//  LoginErrorViewController.swift
//  Straightening
//
//  Created by user220831 on 12/3/22.
//

import UIKit

final class LoginErrorViewController: UIViewController {
    let loginerrorview = LoginErrorView()
// MARK: - overrides
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.layer.addGradientBackground()
    }
    override func loadView() {
        super.loadView()
        view = loginerrorview
    }
}
