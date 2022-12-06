//
//  Create+Alert.swift
//  Straightening
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension Create {
    static func alert(title: String?, message: String?, buttonTitle: String? = "Ok") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.baseView.subviews.first?.backgroundColor = Assets.Colors.weakWhite
        alert.baseView.subviews.last?.removeFromSuperview()
        alert.baseView.tintColor = .label
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        return alert
    }
}
