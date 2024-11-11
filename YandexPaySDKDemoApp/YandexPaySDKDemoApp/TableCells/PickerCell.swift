//
//  SegmentCell.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 15.10.2024.
//

import Foundation
import UIKit

class PickerCell<Values: Titleable>: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
  private var onPickerChanged: ((Values) -> Void)?
  private lazy var label = UILabel()

  private lazy var pickerControl: UIPickerView = {
    let pickerControl = UIPickerView()
    pickerControl.translatesAutoresizingMaskIntoConstraints = false
    pickerControl.delegate = self
    pickerControl.dataSource = self
    return pickerControl
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
      label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
    ])

    contentView.addSubview(pickerControl)
    NSLayoutConstraint.activate([
      pickerControl.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
      pickerControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
      pickerControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      pickerControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      pickerControl.widthAnchor.constraint(equalToConstant: 140)
    ])
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    Values.allCases.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    Values.allCasesTitles[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    onPickerChanged?(Values.allCases.map { $0 } [row])
  }
}

extension PickerCell {
  func configure(
    title: String,
    onPickerChanged: @escaping (Values) -> Void
  ) {
    self.label.text = title
    self.onPickerChanged = onPickerChanged
  }
}
