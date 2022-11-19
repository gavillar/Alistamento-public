//
//  Create+NavigationController.swift
//  Straightening
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

extension Create {
    static func navigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.tintColor = Assets.Colors.reverseDark
        navigationController.navigationBar.prefersLargeTitles = true
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear
        navigationController.navigationBar.standardAppearance = standardAppearance
        navigationController.navigationBar.scrollEdgeAppearance = standardAppearance
        return navigationController
    }
}
