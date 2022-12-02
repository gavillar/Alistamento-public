//
//  PickerView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 07/09/1401 AP.
//

import UIKit

protocol PickerViewDelegate: AnyObject {
    func pickerView(didSelect option: String)
    func pickerView(_ toolBar: UIToolbar)
    func doneButtonTarget()
}

class PickerView: UIPickerView {
// MARK: - variables
    var options: [String]? = nil
    weak var pickerViewDelegate: PickerViewDelegate? {
        didSet {
            setup()
        }
    }
// MARK: - init
    init(pickerViewDelegate: PickerViewDelegate? = nil) {
        self.pickerViewDelegate = pickerViewDelegate
        super.init(frame: .zero)
        dataSource = self
        delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - setup
    func setup() {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        doneButton.tintColor = .black
        toolBar.setItems([spaceButton, doneButton], animated: false)
        pickerViewDelegate?.pickerView(toolBar)
    }
// MARK: - @objc functions
    @objc func done() {
        pickerViewDelegate?.doneButtonTarget()
    }
}

extension PickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options?.count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options?[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewDelegate?.pickerView(didSelect: options?[row] ?? String())
    }
}
