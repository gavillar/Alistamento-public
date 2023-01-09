//
//  ViewControllerRepresentable.swift
//  Straightening
//
//  Created by Josicleison Elves on 14/12/22.
//

import SwiftUI

struct SwiftUI: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    var viewController: UIViewController
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    func makeUIViewController(context: Context) -> UINavigationController {
        let pageViewController = UINavigationController(rootViewController: viewController)
        return pageViewController
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
    static func show(_ viewController: UIViewController) -> some View {
        return self.init(viewController)
    }
}
