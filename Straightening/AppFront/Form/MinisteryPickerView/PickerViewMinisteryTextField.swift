//
//  PickerViewBirthDateTextField.swift
//  br.com.foursys.crud
//
//  Created by user220831 on 5/4/22.
//

import UIKit

typealias PickerMinisteryDisplayNameHandler = ((Any) -> String)
typealias PickerMinisteryItemSelectionHandler = ((Int, Any) -> Void)

final class PickerViewMinisteryTextField: UITextField {
    
    public var pickerMinistery: [Any] = []
    public var displayNameHandler: PickerMinisteryDisplayNameHandler?
    public var itemSelectionHandler: PickerMinisteryItemSelectionHandler?
    private let pickerView = UIPickerView(frame: .zero)
    private var lastSelectRow: Int?

    init() {
        super.init(frame: .zero)
        self.setupView()
        self.toolBar()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    func toolBar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolBar.setItems([spaceButton, doneButton], animated: false)
        self.inputAccessoryView = toolBar
    }

    @objc func doneButtonTapped() {
        self.updateText()
        self.resignFirstResponder()
    }
    private func setupView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.inputView = self.pickerView
    }
    private func updateText() {
        if self.lastSelectRow == nil {
            self.lastSelectRow = 0
        }
        if self.lastSelectRow! > self.pickerMinistery.count {
            return
        }
        let data = self.pickerMinistery[self.lastSelectRow!]
        self.text = self.displayNameHandler?(data)
    }
}

extension PickerViewMinisteryTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = self.pickerMinistery[row]
        return self.displayNameHandler?(data)
    }
}
extension PickerViewMinisteryTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerMinistery.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.lastSelectRow = row
        self.updateText()
        let data = self.pickerMinistery[row]
        self.itemSelectionHandler?(row, data)
    }
}
