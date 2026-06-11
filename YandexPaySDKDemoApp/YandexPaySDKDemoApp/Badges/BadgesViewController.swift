//
//  BadgesViewController.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 17.10.2024.
//

import UIKit
import YandexPaySDK
import Combine

final class BadgesViewController: UIViewController {
  
  private var viewModel: BadgesScreenViewModel = .init()
  
  private var sections: [Section] = [
    .size,
    .appearance([.amout, .align, .theme]),
    .cashbackConfig([.color, .variant]),
    .splitConfig([.color, .variant]),
  ]
  private var splitBadgeHeightConstraint: NSLayoutConstraint = .init()
  private var cashbackBadgeHeightConstraint: NSLayoutConstraint = .init()
  private var badgeHeight: CGFloat = Constants.initialBadgeHeight
  
  private var cancellable: Set<AnyCancellable> = .init()
  
  private lazy var yaPaySplitBadge = UIView()
  private lazy var yaPayCashbackBadge = UIView()
  
  private lazy var settingsTable: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.registerCells(types: [
      SizeCell.self,
      StringInputCell.self,
      SegmentCell<YPBadgeModel.Align>.self,
      SegmentCell<YPTheme>.self,
      SegmentCell<YPBadgeModel.CashbackColor>.self,
      SegmentCell<YPBadgeModel.SplitColor>.self,
      SegmentCell<YPBadgeModel.CashbackVariant>.self,
      SegmentCell<YPBadgeModel.SplitVariant>.self
    ])
    
    tableView.dataSource = self
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Badges"
    view.backgroundColor = UIColor(named: "blue")!
    // Проверьте, что SDK проинициализирован
    guard YandexPaySDKApi.isInitialized else {
      assertionFailure("YandexPaySDK is not initialized.")
      return
    }
    
    createBadges()
    setupLayout()
    observeViewModel()
  }
  
  private func setupLayout() {
    view.addSubview(settingsTable)
    settingsTable.translatesAutoresizingMaskIntoConstraints = false
    
    cashbackBadgeHeightConstraint = yaPayCashbackBadge.heightAnchor.constraint(equalToConstant: badgeHeight)
    splitBadgeHeightConstraint = yaPaySplitBadge.heightAnchor.constraint(equalToConstant: badgeHeight)
    
    NSLayoutConstraint.activate([
      yaPayCashbackBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yaPayCashbackBadge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      yaPayCashbackBadge.widthAnchor.constraint(equalToConstant: Constants.badgeWidth),
      cashbackBadgeHeightConstraint,
      
      yaPaySplitBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yaPaySplitBadge.topAnchor.constraint(equalTo: yaPayCashbackBadge.bottomAnchor, constant: 8),
      yaPaySplitBadge.widthAnchor.constraint(equalToConstant: Constants.badgeWidth),
      splitBadgeHeightConstraint,
      
      settingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingsTable.topAnchor.constraint(equalTo: yaPaySplitBadge.bottomAnchor, constant: 16)
    ])
  }
  
  private func updateBadges() {
    yaPaySplitBadge.removeFromSuperview()
    yaPayCashbackBadge.removeFromSuperview()
    createBadges()
    setupLayout()
  }
  
  private func createBadges() {
    // Создайте нужный бейдж
    yaPaySplitBadge = YandexPaySDKApi.instance.createBadgeView(model: viewModel.splitModel)
    yaPayCashbackBadge = YandexPaySDKApi.instance.createBadgeView(model: viewModel.cashbackModel)
    
    [yaPayCashbackBadge,
     yaPaySplitBadge].forEach { subView in
      view.addSubview(subView)
      subView.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func observeViewModel() {
    viewModel
      .objectWillChange
      .receive(on: DispatchQueue.main)
      .sink { [weak self] output in
        self?.view.backgroundColor = UIColor(
          named: self?.viewModel.theme == .dark ? "blueDark" : "blue"
        )?.withAlphaComponent(1)
        self?.updateBadges()
      }
      .store(in: &cancellable)
  }
}

extension BadgesViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    sections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    sections[section].rowNumbers
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch sections[indexPath.section] {
    case .size:
      let cell = tableView.dequeueCell(withType: SizeCell.self)
      cell.configure(
        title: "Height",
        sliderMinValue: 10,
        sliderMaxValue: 40,
        initialValue: Float(badgeHeight.rounded()),
        onSliderChanged: { [weak self] newValue in
          self?.splitBadgeHeightConstraint.constant = CGFloat(newValue)
          self?.cashbackBadgeHeightConstraint.constant = CGFloat(newValue)
          self?.badgeHeight = CGFloat(newValue)
        }
      )
      return cell
    case let .appearance(items):
      return makeAppearanceCell(item: items[indexPath.row])
    case let .cashbackConfig(items):
      return makeConfigItemCell(item: items[indexPath.row], type: .cashback)
    case let .splitConfig(items):
      return makeConfigItemCell(item: items[indexPath.row], type: .split)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    Constants.cellHeight
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    sections[section].name
  }
}

// MARK: Cells generation
extension BadgesViewController {
  private func makeAppearanceCell(item: AppearanceItem) -> UITableViewCell {
    switch item {
    case .amout:
      let cell = settingsTable.dequeueCell(withType: StringInputCell.self)
      cell.configure(
        title: "Amount",
        value: viewModel.amount,
        keyBoardType: .decimalPad,
        onTextChanged: { [weak self] newValue in
          self?.viewModel.amount = newValue
        }
      )
      return cell
    case .align:
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPBadgeModel.Align>.self)
      cell.configure(
        title: "Align",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.align = newValue
        }
      )
      return cell
    case .theme:
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPTheme>.self)
      cell.configure(
        title: "Theme",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.theme = newValue
        }
      )
      return cell
    }
  }
  
  private func makeConfigItemCell(item: ConfigItem, type: ConfigItemType) -> UITableViewCell {
    switch (item, type) {
    case (.color, .cashback):
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPBadgeModel.CashbackColor>.self)
      cell.configure(
        title: "Color",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.cashbackColor = newValue
        }
      )
      return cell
    case (.color, .split):
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPBadgeModel.SplitColor>.self)
      cell.configure(
        title: "Color",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.splitColor = newValue
        }
      )
      return cell
    case (.variant, .cashback):
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPBadgeModel.CashbackVariant>.self)
      cell.configure(
        title: "Variant",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.cashbackVariant = newValue
        }
      )
      return cell
    case (.variant, .split):
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPBadgeModel.SplitVariant>.self)
      cell.configure(
        title: "Variant",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.splitVariant = newValue
        }
      )
      return cell
    }
  }
}

private extension BadgesViewController {
  enum Constants {
    static let initialBadgeHeight: CGFloat = 40
    static let cellHeight: CGFloat = 44
    static let badgeWidth: CGFloat = 360
  }
}
