//
//  Create.swift
//  Straightening
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import UIKit

struct Create {
    static func buttonRegister() -> UIButton {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .lightGray
        return button
    }
    static func button(_ text: String? = nil,
                       titleColor: UIColor? = nil,
                       cornerRadius: CGFloat = 15,
                       backgroundColor: UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = backgroundColor
        return button
    }
}
