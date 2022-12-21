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
}
