//
//  HomeViewController.swift
//  Straightening
//
//  Created by user220831 on 11/9/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view.addGradientBackground()
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.navigationBar.isHidden = true
    }
}
