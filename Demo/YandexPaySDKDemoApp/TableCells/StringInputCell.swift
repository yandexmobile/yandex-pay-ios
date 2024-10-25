//
//  StringInputCell.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 15.10.2024.
//

import Foundation
import UIKit

class StringInputCell: UITableViewCell {
    private var onTextChanged: ((String) -> Void)?

    private lazy var label = UILabel()

    private lazy var inputField: UITextField = {
        let inputField = UITextField()
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.textAlignment = .right
        inputField.addTarget(self, action: #selector(onTextChangedValue), for: .editingChanged)
        return inputField
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])

        contentView.addSubview(inputField)
        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            inputField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            inputField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            inputField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16)
        ])
    }

    @objc
    private func onTextChangedValue() {
        onTextChanged?(inputField.text ?? "")
    }
}

extension StringInputCell {
    func configure(
        title: String,
        value: String,
        keyBoardType: UIKeyboardType = .default,
        onTextChanged: @escaping (String) -> Void
    ) {
        self.label.text = title
        self.inputField.text = value
        self.inputField.keyboardType = keyBoardType
        self.onTextChanged = onTextChanged
    }
}
