//
//  SegmentCell.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 15.10.2024.
//

import Foundation
import UIKit

class SegmentCell<Values: Titelable>: UITableViewCell {
  private var onSegmentChanged: ((Values) -> Void)?
  
  private lazy var label = UILabel()
  
  private lazy var segmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: Values.allCasesTitles)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.addTarget(self, action: #selector(onSegmentChangedValue), for: .valueChanged)
    return segmentedControl
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
      label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
    ])
    
    contentView.addSubview(segmentedControl)
    NSLayoutConstraint.activate([
      segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
      segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      segmentedControl.heightAnchor.constraint(equalToConstant: 28),
      segmentedControl.widthAnchor.constraint(equalToConstant: 230)
    ])
  }
  
  @objc
  private func onSegmentChangedValue() {
    onSegmentChanged?(Values.allCases.map { $0 }[segmentedControl.selectedSegmentIndex])
  }
}

extension SegmentCell {
  func configure(
    title: String,
    onSegmentChanged: @escaping (Values) -> Void
  ) {
    self.label.text = title
    self.onSegmentChanged = onSegmentChanged
  }
}
