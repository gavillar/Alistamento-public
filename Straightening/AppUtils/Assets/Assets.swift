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
    struct Images {
        static let bible = UIImage(named: "biblia")
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
        static let reverseDark = UIColor(named: "reverseDark")
        static let sand = UIColor(named: "sand")
        static let weakWhiteBlack = UIColor(named: "weakWhiteBlack")
        static let whiteBlack = UIColor(named: "whiteBlack")
        static let weakWhite = UIColor(white: 1, alpha: 0.05)
        static let border = UIColor(cgColor: CGColor(red: 218/255, green: 165/255,
                                                     blue: 32/255, alpha: 1)).cgColor
    }
}
