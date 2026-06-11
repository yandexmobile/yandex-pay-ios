import UIKit
import YandexPaySDK
import Combine

final class PayButtonViewController: UIViewController {
  private var viewModel: PayButtonViewModel
  private var payButtonWidthConstraint: NSLayoutConstraint = .init()
  private var cancellable: Set<AnyCancellable> = Set()
  
  lazy var yaPayButton: YandexPayButton = {
    // Создайте кнопку
    let button: YandexPayButton = YandexPaySDKApi.instance.createButton(
      model: viewModel.buttonModel,
      paymentDataProvider: viewModel,
      presentationContextProvider: viewModel,
      delegate: viewModel
    )
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var settingsTable: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.register(SizeCell.self, forCellReuseIdentifier: "SizeCell")
    tableView.register(SegmentCell<YPTheme>.self, forCellReuseIdentifier: "SegmentCell")
    tableView.register(StringInputCell.self, forCellReuseIdentifier: "StringInputCell")
    tableView.register(ToggleCell.self, forCellReuseIdentifier: "ToggleCell")
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  init(navigationController: UINavigationController) {
    self.viewModel = .init(navigationController: navigationController)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Pay Button"
    view.backgroundColor = .systemBackground
    
    // Проверьте, что SDK проинициализирован
    guard YandexPaySDKApi.isInitialized else {
      assertionFailure("YandexPaySDK is not initialized.")
      return
    }
    addSubviews()
    observeViewModel()
  }
  
  private func addSubviews() {
    // Добавьте кнопку в иерархию
    view.addSubview(yaPayButton)
    
    // Установите layout для кнопки
    NSLayoutConstraint.activate([
      yaPayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yaPayButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
    ])
    
    payButtonWidthConstraint = yaPayButton.widthAnchor.constraint(equalToConstant: 250.0)
    payButtonWidthConstraint.isActive = true
    
    view.addSubview(settingsTable)
    NSLayoutConstraint.activate([
      settingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingsTable.topAnchor.constraint(equalTo: yaPayButton.bottomAnchor, constant: 16)
    ])
    
  }
  
  private func observeViewModel() {
    viewModel.$amount
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] _ in
        guard let self else { return }
        yaPayButton.order = (viewModel.amountNumber, viewModel.currencyCode)
      })
      .store(in: &cancellable)
    
    viewModel.$theme.sink(receiveValue: { [weak self] theme in
      guard let self else { return }
      yaPayButton.appearance = theme
    })
    .store(in: &cancellable)
    
    viewModel.$cornerRadius.sink(receiveValue: { [weak self] cornerRadius in
      guard let self else { return }
      yaPayButton.cornerRadius = cornerRadius
    })
    .store(in: &cancellable)
    
    viewModel.$isBordered.sink(receiveValue: { [weak self] isBordered in
      guard let self else { return }
      yaPayButton.isBordered = isBordered
    })
    .store(in: &cancellable)
    
    viewModel.$currencyCodeString
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] _ in
        guard let self else { return }
        yaPayButton.order = (viewModel.amountNumber, viewModel.currencyCode)
      })
      .store(in: &cancellable)
    
    Publishers.CombineLatest(viewModel.$isCardAvailable, viewModel.$isSplitAvailable)
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] _ in
        guard let self else { return }
        yaPayButton.preferredPaymentMethods = viewModel.preferredPaymentMethods
      })
      .store(in: &cancellable)
  }
}

extension PayButtonViewController: UITableViewDelegate {
}

extension PayButtonViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      2
    case 1:
      4
    case 2:
      2
    default:
      0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch (indexPath.section, indexPath.row) {
    case (0, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell") as! SizeCell
      cell.configure(
        title: "Width",
        sliderMinValue: 100,
        sliderMaxValue: 360,
        initialValue: 250,
        onSliderChanged: { [weak self] newValue in
          self?.payButtonWidthConstraint.constant = CGFloat(newValue)
        }
      )
      return cell
    case (0, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell") as! SizeCell
      cell.configure(
        title: "Corner radius",
        sliderMinValue: 0,
        sliderMaxValue: 30,
        initialValue: 16,
        onSliderChanged: { [weak self] newValue in
          self?.viewModel.cornerRadius = CGFloat(newValue)
        }
      )
      return cell
    case (1, 0):
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
    case (1, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: "StringInputCell") as! StringInputCell
      cell.configure(
        title: "Currency code",
        value: viewModel.currencyCodeString,
        onTextChanged: { [weak self] newValue in
          self?.viewModel.currencyCodeString = newValue
        }
      )
      return cell
    case (1, 2):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Split payment available",
        isOn: viewModel.isSplitAvailable,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.isSplitAvailable = newValue
        }
      )
      return cell
    case (1, 3):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Card payment available",
        isOn: viewModel.isCardAvailable,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.isCardAvailable = newValue
        }
      )
      return cell
    case (2, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCell") as! SegmentCell<YPTheme>
      cell.configure(
        title: "Theme",
        onSegmentChanged: { [weak self] newValue in
          self?.viewModel.theme = newValue
        }
      )
      return cell
    case (2, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleCell") as! ToggleCell
      cell.configure(
        title: "Border",
        isOn: viewModel.isBordered,
        onToggleChanged: { [weak self] newValue in
          self?.viewModel.isBordered = newValue
        }
      )
      return cell
    default:
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    44
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
      "Appearance"
    default:
      nil
    }
  }
}
