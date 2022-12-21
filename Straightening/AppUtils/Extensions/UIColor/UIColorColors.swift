//
//  UIColorColors.swift
//  Straightening
//
//  Created by Josicleison Elves on 21/12/22.
//

import UIKit

extension UIColor {
    class var background: UIColor {UIColor(named: "background") ?? UIColor()}
    class var blue: UIColor {UIColor(named: "blue") ?? UIColor()}
    class var blueDarkBlue: UIColor {UIColor(named: "blueDarkBlue") ?? UIColor()}
    class var brown: UIColor {UIColor(named: "brown") ?? UIColor()}
    class var brownDarkBrown: UIColor {UIColor(named: "brownDarkBrown") ?? UIColor()}
    class var red: UIColor {UIColor(named: "red") ?? UIColor()}
    class var green: UIColor {UIColor(named: "green") ?? UIColor()}
    class var greenDarkGreen: UIColor {UIColor(named: "greenDarkGreen") ?? UIColor()}
    class var lightBlue: UIColor {UIColor(named: "lightBlue") ?? UIColor()}
    class var lightGreen: UIColor {UIColor(named: "lightGreen") ?? UIColor()}
    class var orange: UIColor {UIColor(named: "orange") ?? UIColor()}
    class var purple: UIColor {UIColor(named: "purple") ?? UIColor()}
    class var reverseDark: UIColor {UIColor(named: "reverseDark") ?? UIColor()}
    class var sand: UIColor {UIColor(named: "sand") ?? UIColor()}
    class var weakWhiteBlack: UIColor {UIColor(named: "weakWhiteBlack") ?? UIColor()}
    class var whiteBlack: UIColor {UIColor(named: "whiteBlack") ?? UIColor()}
    class var border: UIColor {UIColor(cgColor: CGColor(red: 218/255, green: 165/255, blue: 32/255, alpha: 1))}
    class var weakWhite: UIColor {UIColor(white: 1, alpha: 0.1)}
    class func weakWhite(alpha: CGFloat = 0.1) -> UIColor? {
        return UIColor(white: 1, alpha: alpha)
    }
}
