//
//  CustomUiTextField.swift
//  br.com.foursys.crud
//
//  Created by user220831 on 6/6/22.
//

import UIKit  // Don't forget this

class UiTextFieldNoPaste: UITextField {
   override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
   }
}
