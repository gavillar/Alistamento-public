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
    var formatMask: String?
    init() {
        super.init(frame: .zero)
        delegate = self
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

extension BindingTextField: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        additionalCellTextFieldSetup(textField)
    }

    func additionalCellTextFieldSetup(_ textField: UITextField?) {
        if let formatMask = formatMask {
            textField?.text = textField?.text?.formatMask(formatMask)
        }
//        "(##)#####-####)"
    }
}
