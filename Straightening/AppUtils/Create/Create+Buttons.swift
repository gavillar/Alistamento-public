//
//  Create.swift
//  Straightening
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import Foundation
import UIKit

struct Create {
    
    static func ButtonRegister() -> UIButton {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .lightGray
        
        return button
    }
    
    static func Button() -> UIButton {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .lightGray
        
        return button
    }
    
}
