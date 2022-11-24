//
//  BindingCepTextField.swift
//  Straightening
//
//  Created by user220831 on 11/22/22.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    var textChanged: (String) -> Void = {_ in}
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
     private func commonInit() {
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    func bind(callBack: @escaping (String) -> Void) {
        textChanged = callBack
    }
    @objc func textFieldDidChanged(_ sender: UITextField) {
        if let text = sender.text {
            textChanged(text)
        }
    }
}
