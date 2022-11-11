//
//  Assets.swift
//  Straightening
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import UIKit

struct Assets {
    static func font(_ size: CGFloat = 20, weight: UIFont.Weight = .bold) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    struct Colors {
        static let blue = UIColor(named: "blue")
        static let brown = UIColor(named: "brown")
        static let green = UIColor(named: "green")
        static let lightBlue = UIColor(named: "lightBlue")
        static let orange = UIColor(named: "orange")
        static let pink = UIColor(named: "pink")
    }
}
