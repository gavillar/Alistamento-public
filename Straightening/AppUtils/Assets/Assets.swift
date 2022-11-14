//
//  Assets.swift
//  Straightening
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import UIKit

struct Assets {
    static func font(_ size: CGFloat = 20, weight: UIFont.Weight = .bold) -> UIFont? {
        return UIFont(name: "Snell Roundhand", size: size)
    }
    struct Colors {
        static let background = UIColor(named: "background")
        static let blue = UIColor(named: "blue")
        static let blueDarkBlue = UIColor(named: "blueDarkBlue")
        static let brown = UIColor(named: "brown")
        static let brownDarkBrown = UIColor(named: "brownDarkBrown")
        static let darkGreen = UIColor(named: "darkGreen")
        static let green = UIColor(named: "green")
        static let greenDarkGreen = UIColor(named: "greenDarkGreen")
        static let lightBlue = UIColor(named: "lightBlue")
        static let lightGreen = UIColor(named: "lightGreen")
        static let orange = UIColor(named: "orange")
        static let pink = UIColor(named: "pink")
        static let sand = UIColor(named: "sand")
        static let weakWhite = UIColor(white: 1, alpha: 0.05)
    }
}
