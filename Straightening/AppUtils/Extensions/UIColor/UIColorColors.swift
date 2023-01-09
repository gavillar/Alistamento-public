//
//  UIColorColors.swift
//  Straightening
//
//  Created by Josicleison Elves on 21/12/22.
//

import UIKit

extension UIColor {
    class var background: UIColor? {UIColor(named: "background")}
    class var blue: UIColor? {UIColor(named: "blue")}
    class var blueDarkBlue: UIColor? {UIColor(named: "blueDarkBlue")}
    class var brown: UIColor? {UIColor(named: "brown")}
    class var brownDarkBrown: UIColor? {UIColor(named: "brownDarkBrown")}
    class var red: UIColor? {UIColor(named: "red")}
    class var green: UIColor? {UIColor(named: "green")}
    class var greenDarkGreen: UIColor? {UIColor(named: "greenDarkGreen")}
    class var lightBlue: UIColor? {UIColor(named: "lightBlue")}
    class var lightGreen: UIColor? {UIColor(named: "lightGreen")}
    class var orange: UIColor? {UIColor(named: "orange")}
    class var purple: UIColor? {UIColor(named: "purple")}
    class var reverseDark: UIColor? {UIColor(named: "reverseDark")}
    class var sand: UIColor? {UIColor(named: "sand")}
    class var weakWhiteBlack: UIColor? {UIColor(named: "weakWhiteBlack")}
    class var whiteBlack: UIColor? {UIColor(named: "whiteBlack")}
    class var border: UIColor {UIColor(cgColor: CGColor(red: 218/255, green: 165/255, blue: 32/255, alpha: 1))}
    class var weakWhite: UIColor {UIColor(white: 1, alpha: 0.1)}
    class func weakWhite(alpha: CGFloat = 0.1) -> UIColor? {
        return UIColor(white: 1, alpha: alpha)
    }
}
