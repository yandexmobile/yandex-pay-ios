//
//  SizeCell.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 15.10.2024.
//

import Foundation
import UIKit

class SizeCell: UITableViewCell {
    private var onSliderChanged: ((Float) -> Void)?

    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(onSliderChangedValue), for: .valueChanged)
        return slider
    }()

    private lazy var label = UILabel()
    private lazy var size = UILabel()

    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [label, slider, size])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.frame = .init(x: 0, y: 0, width: 100, height: 40)
        return stack
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
        contentView.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    @objc
    private func onSliderChangedValue() {
        size.text = "\(Int(slider.value))"
        onSliderChanged?(slider.value)
    }
}

extension SizeCell {
    func configure(
        title: String,
        sliderMinValue: Float,
        sliderMaxValue: Float,
        sliderValue: Float,
        onSliderChanged: @escaping (Float) -> Void
    ) {
        label.text = title
        slider.maximumValue = sliderMaxValue
        slider.minimumValue = sliderMinValue
        slider.setValue(sliderValue, animated: false)
        size.text = slider.value.formatted()
        self.onSliderChanged = onSliderChanged
    }
}
