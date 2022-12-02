//
//  DatePicker.swift
//  Straightening
//
//  Created by user220831 on 11/24/22.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func datePicker(_ toolBar: UIToolbar)
    func doneButtonTarget()
}

final class DatePicker: UIDatePicker {
// MARK: - variables
    var dayMonthYear: String {String(date.formatted().split(separator: " ").first ?? "")}
    weak var delegate: DatePickerDelegate? {
        didSet {
            setup()
        }
    }
// MARK: - overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        preferredDatePickerStyle = .wheels
        datePickerMode = .date
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
        doneButton.tintColor = Assets.Colors.brown
        toolBar.setItems([spaceButton, doneButton], animated: false)
        delegate?.datePicker(toolBar)
//        textField.inputView = datePicker
    }
// MARK: - @objc functions
    @objc func done() {
        delegate?.doneButtonTarget()
    }
}
