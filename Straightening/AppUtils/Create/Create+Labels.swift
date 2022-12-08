//
//  Create+Labels.swift
//  Straightening
//
//  Created by user220831 on 11/10/22.
//

import UIKit

extension Create {
    static func labelTitle(_ text: String? = nil) -> UILabel {
       let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
       

        return label
    }
    static func label(_ text: String? = nil,
                      font: UIFont? = Assets.font(50),
                      alignment: NSTextAlignment = .center,
                      numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = Assets.Colors.reverseDark
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.font = font
        return label
    }
}
