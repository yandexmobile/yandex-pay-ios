//
//  WidgetViewController.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 16.10.2024.
//

import UIKit
import YandexPaySDK
import Combine

final class WidgetViewController: UIViewController {
  private var viewModel: WidgetsScreenViewModel = .init()
  private var widgetWidthConstraint: NSLayoutConstraint = .init()
  private var widgetWidth: CGFloat = 300
  private var cancellable: Set<AnyCancellable> = Set()
  private var isTypeChanged: Bool = true

  lazy var yaPayWidget = UIView()

  lazy var settingsTable: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.register(SizeCell.self, forCellReuseIdentifier: "SizeCell")
    tableView.register(SegmentCell<WidgetsScreenViewModel.WidgetType>.self, forCellReuseIdentifier: "SegmentCellWidgetType")
    tableView.register(SegmentCell<YPCheckoutWidgetModel.Style>.self, forCellReuseIdentifier: "SegmentCellCheckoutStyle")
    tableView.register(SegmentCell<YPItemWidgetModel.Style>.self, forCellReuseIdentifier: "SegmentCellItemStyle")
    tableView.register(SegmentCell<YPTheme>.self, forCellReuseIdentifier: "SegmentCellTheme")
    tableView.register(SegmentCell<YPBnplPreviewWidgetModel.Appearance.Background>.self, forCellReuseIdentifier: "SegmentCellBnplBackground")
    tableView.register(SegmentCell<YPBnplPreviewWidgetModel.Appearance.WidgetSize>.self, forCellReuseIdentifier: "SegmentCellBnplSize")
    tableView.register(PickerCell<YPBnplPreviewWidgetModel.HeaderStyle>.self, forCellReuseIdentifier: "PickerCellHeader")
    tableView.register(StringInputCell.self, forCellReuseIdentifier: "StringInputCell")
    tableView.register(ToggleCell.self, forCellReuseIdentifier: "ToggleCell")
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Widgets"
    view.backgroundColor = UIColor(named: "blue")!.withAlphaComponent(1)

    // Проверьте, что SDK проинициализирован
    guard YandexPaySDKApi.isInitialized else {
      assertionFailure("YandexPaySDK is not initialized.")
      return
    }

    view.addSubview(settingsTable)
    createYaPayItemWidget()

    observeViewModel()
  }

  private func addWidget() {
    // Добавьте виджет в иерархию
    view.addSubview(yaPayWidget)
    yaPayWidget.translatesAutoresizingMaskIntoConstraints = false
    // Установите layout для виджета
    NSLayoutConstraint.activate([
      yaPayWidget.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yaPayWidget.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    ])

    widgetWidthConstraint = yaPayWidget.widthAnchor.constraint(equalToConstant: widgetWidth)
    widgetWidthConstraint.isActive = true
  }

  private func makeTableViewConstraints() {
    NSLayoutConstraint.activate([
      settingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingsTable.topAnchor.constraint(equalTo: yaPayWidget.bottomAnchor, constant: 16)
    ])
  }

  private func createYaPayItemWidget() {
    yaPayWidget.removeFromSuperview()
    // Создайте нужный виджет
    yaPayWidget = YandexPaySDKApi.instance.createItemWidgetView(
      model: YPItemWidgetModel(
        amount: Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero,
        currency: .rub,
        style: viewModel.style,
        appearance: viewModel.appearance
      ),
      presentationContextProvider: viewModel
    )

    addWidget()
    if isTypeChanged {
      makeTableViewConstraints()
    }
  }

  private func createYaPayCheckoutWidget() {
    yaPayWidget.removeFromSuperview()
    yaPayWidget = YandexPaySDKApi.instance.createCheckoutWidgetView(
      model: YPCheckoutWidgetModel(
        amount: Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero,
        currency: .rub,
        style: viewModel.infoWidgetCheckoutStyle,
        appearance: viewModel.infoWidgetCheckoutAppearance
      )
    )
    addWidget()
    if isTypeChanged {
      makeTableViewConstraints()
    }
  }

  private func createYaPayBnplWidget() {
    yaPayWidget.removeFromSuperview()
    yaPayWidget = YandexPaySDKApi.instance.createBnplPreviewWidgetView(
      model: YPBnplPreviewWidgetModel(
        amount: Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero,
        currency: .rub,
        appearance: viewModel.bnplPreviewWidgetAppearance,
        header: viewModel.bnplPreviewWidgetHeaderAppearance
      ),
      presentationContextProvider: viewModel,
      delegate: viewModel
    )
    addWidget()
    if isTypeChanged {
      makeTableViewConstraints()
    }
  }

  private func observeViewModel() {
    Publishers.CombineLatest4(
      viewModel.$amount,
      viewModel.$appearance,
      viewModel.$infoWidgetCheckoutAppearance,
      viewModel.$infoWidgetCheckoutStyle
    )
    .combineLatest(viewModel.$style)
    .combineLatest(viewModel.$bnplPreviewWidgetAppearance)
    .combineLatest(viewModel.$bnplPreviewWidgetHeaderAppearance)
    .combineLatest(viewModel.$bnplPreviewWidgetBackgroundColor)
    .combineLatest(viewModel.$widgetType)
    .receive(on: DispatchQueue.main)
    .sink(receiveValue: { [weak self] viewModel in
      guard let self else { return }
      settingsTable.reloadData()
      switch viewModel.1 {
      case .item:
        createYaPayItemWidget()
      case .checkout:
        createYaPayCheckoutWidget()
      case .bnplPreview:
        createYaPayBnplWidget()
      }
    })
    .store(in: &cancellable)
  }
}

extension WidgetViewController: UITableViewDelegate {
}

extension WidgetViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    5
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch (section, viewModel.widgetType) {
    case (0, _):
      1
    case (1, _):
      1
    case (2, .bnplPreview):
      1
    case (2, _):
      2
    case (3, .checkout):
      1
    case (3, .item):
      2
    case (3, .bnplPreview):
      6
    case (4, .bnplPreview):
      2
    default:
      0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch (indexPath.section, indexPath.row, viewModel.widgetType) {
    case (0, 0, _):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell") as! SizeCell
      cell.configure(
        title: "Width",
        sliderMinValue: 280,
        sliderMaxValue: 360,
        sliderValue: Float(widgetWidth.rounded()),
        onSliderChanged: { [weak self] newValue in
          self?.widgetWidthConstraint.constant = CGFloat(newValue)
          self?.widgetWidth = CGFloat(newValue)
        }
      )
      return cell
    case (1, 0, _):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellWidgetType") as! SegmentCell<WidgetsScreenViewModel.WidgetType>
      cell.configure(
        title: "Type",
        onSegmentChanged: { [weak self] newValue in
          self?.isTypeChanged = (self?.viewModel.widgetType != newValue)
          self?.viewModel.widgetType = newValue
        }
      )
      return cell
    case (2, 0, _):
      let cell = tableView.dequeueReusableCell(withIdentifier: "StringInputCell") as! StringInputCell
      cell.configure(
        title: "Amount",
        value: viewModel.amount,
        keyBoardType: .decimalPad,
        onTextChanged: { [weak self] newValue in
          self?.viewModel.amount = newValue
        }
      )
      return cell
    case (2, 1, .checkout):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellCheckoutStyle") as! SegmentCell<YPCheckoutWidgetModel.Style>
      cell.configure(
        title: "Style",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.infoWidgetCheckoutStyle = newValue
        }
      )
      return cell
    case (2, 1, .item):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellItemStyle") as! SegmentCell<YPItemWidgetModel.Style>
      cell.configure(
        title: "Style",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.style = newValue
        }
      )
      return cell
    case (3, 0, _):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellTheme") as! SegmentCell<YPTheme>
      cell.configure(
        title: "Theme",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.appearance.theme = newValue
          self?.viewModel.infoWidgetCheckoutAppearance.theme = newValue
        }
      )
      return cell
    case (3, 1, .item):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Transparent",
        isOn: viewModel.appearance.isTransparent,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.appearance.isTransparent = newValue
        }
      )
      return cell
    case (3, 1, .bnplPreview):
        let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell") as! SizeCell
        cell.configure(
            title: "Radius",
            sliderMinValue: 0,
            sliderMaxValue: 32,
            sliderValue: Float(viewModel.bnplPreviewWidgetAppearance.radius.rounded()),
            onSliderChanged: { [weak self] newValue in
              self?.viewModel.bnplPreviewWidgetAppearance.radius = CGFloat(newValue)
            }
        )
        return cell
    case (3, 2, .bnplPreview):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellBnplBackground") as! SegmentCell<YPBnplPreviewWidgetModel.Appearance.Background>
      cell.configure(
        title: "Background",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.bnplPreviewWidgetAppearance.background = newValue
        }
      )
      return cell
    case (3, 3, .bnplPreview):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellBnplSize") as! SegmentCell<YPBnplPreviewWidgetModel.Appearance.WidgetSize>
      cell.configure(
        title: "Widget Size",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.bnplPreviewWidgetAppearance.size = newValue
        }
      )
      return cell
    case (3, 4, .bnplPreview):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Outline",
        isOn: viewModel.bnplPreviewWidgetAppearance.hasOutline,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.bnplPreviewWidgetAppearance.hasOutline = newValue
        }
      )
      return cell
    case (3, 5, .bnplPreview):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Padding",
        isOn: viewModel.bnplPreviewWidgetAppearance.hasPadding,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.bnplPreviewWidgetAppearance.hasPadding = newValue
        }
      )
      return cell
    case (4, 0, .bnplPreview):
      let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCellHeader") as! PickerCell<YPBnplPreviewWidgetModel.HeaderStyle>
      cell.configure(
        title: "Select header style",
        onPickerChanged: { [weak self] newValue in
          self?.viewModel.bnplPreviewWidgetHeaderAppearance = newValue
        }
      )
      return cell
    case (4, 1, .bnplPreview):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Show button",
        isOn: viewModel.bnplPreviewWidgetAppearance.hasCheckoutButton,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.bnplPreviewWidgetAppearance.hasCheckoutButton = newValue
        }
      )
      return cell
    default:
      return UITableViewCell()
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if (indexPath.section, indexPath.row) == (4, 0) {
      return 160
    }
    return 44
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      "Size"
    case 1:
      "Order"
    case 2:
      "General"
    case 3:
      "Appearance"
    default:
      nil
    }
  }
}
