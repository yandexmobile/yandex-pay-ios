//
//  WidgetViewController.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 16.10.2024.
//

import UIKit
import YandexPaySDK
import Combine

// MARK: WidgetViewController
final class WidgetViewController: UIViewController {
  
  // MARK: Properties
  private var viewModel: WidgetsScreenViewModel = .init()
  private var sections: [Section] = []
  private var widgetWidthConstraint: NSLayoutConstraint = .init()
  private var cancellable: Set<AnyCancellable> = .init()
  private var widgetContainer = UIStackView()
  
  private lazy var settingsTable: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.registerCells(types: [
      SizeCell.self,
      SegmentCell<WidgetsScreenViewModel.WidgetType>.self,
      SegmentCell<YPCheckoutWidgetModel.Style>.self,
      SegmentCell<YPItemWidgetModel.Style>.self,
      SegmentCell<YPTheme>.self,
      SegmentCell<YPUltimateWidgetModel.Appearance.Background>.self,
      SegmentCell<YPUltimateWidgetModel.Appearance.WidgetSize>.self,
      PickerCell<YPUltimateWidgetModel.HeaderStyle>.self,
      StringInputCell.self,
      ToggleCell.self
    ])
    tableView.dataSource = self
    return tableView
  }()
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Widgets"
    view.backgroundColor = UIColor(named: "blue")?.withAlphaComponent(1)
    
    // Проверьте, что SDK проинициализирован
    guard YandexPaySDKApi.isInitialized else {
      assertionFailure("YandexPaySDK is not initialized.")
      return
    }
    
    setupLayout()
    observeViewModel()
  }
  
  // MARK: Private methods
  private func setupLayout() {
    view.addSubview(settingsTable)
    view.addSubview(widgetContainer)
    settingsTable.translatesAutoresizingMaskIntoConstraints = false
    widgetContainer.translatesAutoresizingMaskIntoConstraints = false
    widgetWidthConstraint = widgetContainer.widthAnchor.constraint(
      equalToConstant: 300
    )
    NSLayoutConstraint.activate([
      widgetContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      widgetContainer.topAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.topAnchor,
        constant: 8
      ),
      widgetWidthConstraint,
      settingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingsTable.topAnchor.constraint(
        equalTo: widgetContainer.bottomAnchor,
        constant: 16
      )
    ])
  }
  
  private func createYaPayWidget(
    type: WidgetsScreenViewModel.WidgetType
  ) {
    widgetContainer.arrangedSubviews.forEach { $0.removeFromSuperview() }
    
    let amount = Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero
    let yaPayWidget: UIView = switch type {
    case .item:
      YandexPaySDKApi.instance.createItemWidgetView(
        model: YPItemWidgetModel(
          amount: amount,
          currency: .rub,
          style: viewModel.style,
          appearance: viewModel.appearance
        ),
        presentationContextProvider: viewModel
      )
    case .checkout:
      YandexPaySDKApi.instance.createCheckoutWidgetView(
        model: YPCheckoutWidgetModel(
          amount: amount,
          currency: .rub,
          style: viewModel.infoWidgetCheckoutStyle,
          appearance: viewModel.infoWidgetCheckoutAppearance
        )
      )
    case .ultimate:
      YandexPaySDKApi.instance.createUltimateWidgetView(
        model: YPUltimateWidgetModel(
          amount: amount,
          currency: .rub,
          style: viewModel.ultimateWidgetStyle,
          appearance: viewModel.ultimateWidgetAppearance,
          header: viewModel.ultimateWidgetHeaderAppearance
        ),
        presentationContextProvider: viewModel,
        delegate: viewModel
      )
    }
    
    widgetContainer.addArrangedSubview(yaPayWidget)
  }
  
  private func observeViewModel() {
    viewModel
      .objectWillChange
      .prepend(())
      .receive(on: DispatchQueue.main)
      .sink { [unowned self] output in
        sections = [.size, .order]
        switch viewModel.widgetType {
        case .item:
          sections += [.general([.amout, .style]), .appearance([.theme, .transparent])]
        case .checkout:
          sections += [.general([.amout, .style]), .appearance([.theme])]
        case .ultimate:
          sections += [
            .general([.amout]),
            .appearance([.theme, .radius, .background, .widgetSize, .outline, .padding]),
            .headerStyle([.headerSelection, .button])
          ]
        }
        createYaPayWidget(type: viewModel.widgetType)
        settingsTable.reloadData()
      }
      .store(in: &cancellable)
  }
}

// MARK: UITableViewDataSource
extension WidgetViewController: UITableViewDataSource {
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
        title: "Width",
        sliderMinValue: 280,
        sliderMaxValue: 360,
        initialValue: Float(widgetWidthConstraint.constant.rounded()),
        onSliderChanged: { [weak self] newValue in
          self?.widgetWidthConstraint.constant = CGFloat(newValue)
        }
      )
      return cell
    case .order:
      let cell = tableView.dequeueCell(withType: SegmentCell<WidgetsScreenViewModel.WidgetType>.self)
      cell.configure(
        title: "Type",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.widgetType = newValue
        }
      )
      return cell
    case let .general(items):
      return makeGeneralCell(item: items[indexPath.row])
    case let .appearance(items):
      return makeAppearanceCell(item: items[indexPath.row])
    case let .headerStyle(items):
      return makeHeaderCell(item: items[indexPath.row])
    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    sections[section].name
  }
}

// MARK: Cells generation
extension WidgetViewController {
  private func makeGeneralCell(item: GeneralItem) -> UITableViewCell {
    switch (item, viewModel.widgetType) {
    case (.amout, _):
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
    case (.style, .checkout):
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPCheckoutWidgetModel.Style>.self)
      cell.configure(
        title: "Style",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.infoWidgetCheckoutStyle = newValue
        }
      )
      return cell
    case (.style, .item):
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPItemWidgetModel.Style>.self)
      cell.configure(
        title: "Style",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.style = newValue
        }
      )
      return cell
    case (.style, .ultimate):
      return UITableViewCell()
    }
  }
  
  private func makeAppearanceCell(item: AppearanceItem) -> UITableViewCell {
    switch item {
    case .theme:
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPTheme>.self)
      cell.configure(
        title: "Theme",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.appearance.theme = newValue
          self?.viewModel.infoWidgetCheckoutAppearance.theme = newValue
        }
      )
      return cell
    case .transparent:
      let cell = settingsTable.dequeueCell(withType: ToggleCell.self)
      cell.configure(
        title: "Transparent",
        isOn: viewModel.appearance.isTransparent,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.appearance.isTransparent = newValue
        }
      )
      return cell
    case .radius:
      let cell = settingsTable.dequeueCell(withType: SizeCell.self)
      cell.configure(
        title: "Radius",
        sliderMinValue: 0,
        sliderMaxValue: 32,
        initialValue: Float(viewModel.ultimateWidgetAppearance.radius.rounded()),
        onSliderChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetAppearance.radius = CGFloat(newValue)
        }
      )
      return cell
    case .background:
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPUltimateWidgetModel.Appearance.Background>.self)
      cell.configure(
        title: "Background",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetAppearance.background = newValue
        }
      )
      return cell
    case .widgetSize:
      let cell = settingsTable.dequeueCell(withType: SegmentCell<YPUltimateWidgetModel.Appearance.WidgetSize>.self)
      cell.configure(
        title: "Widget Size",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetAppearance.size = newValue
        }
      )
      return cell
    case .outline:
      let cell = settingsTable.dequeueCell(withType: ToggleCell.self)
      cell.configure(
        title: "Outline",
        isOn: viewModel.ultimateWidgetAppearance.hasOutline,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetAppearance.hasOutline = newValue
        }
      )
      return cell
    case .padding:
      let cell = settingsTable.dequeueCell(withType: ToggleCell.self)
      cell.configure(
        title: "Padding",
        isOn: viewModel.ultimateWidgetAppearance.hasPadding,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetAppearance.hasPadding = newValue
        }
      )
      return cell
    }
  }
  
  private func makeHeaderCell(item: HeaderItem) -> UITableViewCell {
    switch item {
    case .headerSelection:
      let cell = settingsTable.dequeueCell(withType: PickerCell<YPUltimateWidgetModel.HeaderStyle>.self)
      cell.configure(
        title: "Select header style",
        onPickerChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetHeaderAppearance = newValue
        }
      )
      return cell
    case .button:
      let cell = settingsTable.dequeueCell(withType: ToggleCell.self)
      cell.configure(
        title: "Show button",
        isOn: viewModel.ultimateWidgetAppearance.hasCheckoutButton,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.ultimateWidgetAppearance.hasCheckoutButton = newValue
        }
      )
      return cell
    }
  }
}
