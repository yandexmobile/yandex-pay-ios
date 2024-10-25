//
//  ToggleCell.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 16.10.2024.
//

import Foundation
import UIKit

class ToggleCell: UITableViewCell {
    private var onToggleChanged: ((Bool) -> Void)?

    private lazy var label = UILabel()

    private lazy var toggle: UISwitch = {
        let inputField = UISwitch()
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.addTarget(self, action: #selector(onToggleChangedValue), for: .valueChanged)
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

        contentView.addSubview(toggle)
        NSLayoutConstraint.activate([
            toggle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            toggle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            toggle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            toggle.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16)
        ])
    }

    @objc
    private func onToggleChangedValue() {
        onToggleChanged?(toggle.isOn)
    }
}

extension ToggleCell {
    func configure(
        title: String,
        isOn: Bool,
        onToggleChanged: @escaping (Bool) -> Void
    ) {
        self.label.text = title
        self.toggle.isOn = isOn
        self.onToggleChanged = onToggleChanged
    }
}
