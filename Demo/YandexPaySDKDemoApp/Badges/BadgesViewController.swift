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
    
    private var splitBadgeHeightConstraint: NSLayoutConstraint = .init()
    private var cashbackBadgeHeightConstraint: NSLayoutConstraint = .init()
    private var badgeHeight: CGFloat = 20
    
    private var cancellable: Set<AnyCancellable> = Set()
    
    lazy var yaPaySplitBadge = UIView()
    lazy var yaPayCashbackBadge = UIView()
    
    lazy var settingsTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(SizeCell.self, forCellReuseIdentifier: "SizeCell")
        tableView.register(SegmentCell<YPTheme>.self, forCellReuseIdentifier: "SegmentCellTheme")
        tableView.register(SegmentCell<YPBadgeModel.Align>.self, forCellReuseIdentifier: "SegmentCellAlign")
        tableView.register(SegmentCell<YPBadgeModel.SplitColor>.self, forCellReuseIdentifier: "SegmentCellSplitColor")
        tableView.register(SegmentCell<YPBadgeModel.CashbackColor>.self, forCellReuseIdentifier: "SegmentCellCashbackColor")
        tableView.register(SegmentCell<YPBadgeModel.CashbackVariant>.self, forCellReuseIdentifier: "SegmentCellCashbackVariant")
        tableView.register(SegmentCell<YPBadgeModel.SplitVariant>.self, forCellReuseIdentifier: "SegmentCellSplitVariant")
        tableView.register(StringInputCell.self, forCellReuseIdentifier: "StringInputCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Badges"
        view.backgroundColor = UIColor(named: "blue")!.withAlphaComponent(1)
        // Проверьте, что SDK проинициализирован
        guard YandexPaySDKApi.isInitialized else {
            assertionFailure("YandexPaySDK is not initialized.")
            return
        }
        
        createBadges()
        addBadges()
        view.addSubview(settingsTable)
        makeTableViewConstraints()
        observeViewModel()
    }
    
    private func addBadges() {
        // Добавьте бэйдж кэшбэка в иерархию
        view.addSubview(yaPayCashbackBadge)
        yaPayCashbackBadge.translatesAutoresizingMaskIntoConstraints = false
        // Установите layout для бэйджа
        NSLayoutConstraint.activate([
            yaPayCashbackBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yaPayCashbackBadge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            yaPayCashbackBadge.widthAnchor.constraint(equalToConstant: 360)
        ])
        
        // Добавьте бэйдж сплита в иерархию
        view.addSubview(yaPaySplitBadge)
        yaPaySplitBadge.translatesAutoresizingMaskIntoConstraints = false
        // Установите layout для бэйджа
        NSLayoutConstraint.activate([
            yaPaySplitBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yaPaySplitBadge.topAnchor.constraint(equalTo: yaPayCashbackBadge.bottomAnchor, constant: 8),
            yaPaySplitBadge.widthAnchor.constraint(equalToConstant: 360)
        ])
        
        cashbackBadgeHeightConstraint = yaPayCashbackBadge.heightAnchor.constraint(equalToConstant: badgeHeight)
        cashbackBadgeHeightConstraint.isActive = true
        
        splitBadgeHeightConstraint = yaPaySplitBadge.heightAnchor.constraint(equalToConstant: badgeHeight)
        splitBadgeHeightConstraint.isActive = true
    }
    
    private func makeTableViewConstraints() {
        NSLayoutConstraint.activate([
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
        addBadges()
        makeTableViewConstraints()
    }
    
    private func createBadges() {
        yaPaySplitBadge = YandexPaySDKApi.instance.createBadgeView(model: viewModel.splitModel)
        yaPayCashbackBadge = YandexPaySDKApi.instance.createBadgeView(model: viewModel.cashbackModel)
    }
    
    private func observeViewModel() {
        Publishers.CombineLatest4(
            viewModel.$amount,
            viewModel.$theme,
            viewModel.$align,
            viewModel.$cashbackColor
        )
        .combineLatest(viewModel.$cashbackVariant)
        .combineLatest(viewModel.$splitColor)
        .combineLatest(viewModel.$splitVariant)
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] viewModel in
            self?.view.backgroundColor = (viewModel.0.0.0.1 == .dark) ? UIColor(named: "blueDark")!.withAlphaComponent(1) : UIColor(named: "blue")!.withAlphaComponent(1)
            self?.updateBadges()
        })
        .store(in: &cancellable)
    }
}

extension BadgesViewController: UITableViewDelegate {
}

extension BadgesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            1
        case 1:
            3
        case 2:
            2
        case 3:
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
                title: "Height",
                sliderMinValue: 10,
                sliderMaxValue: 40,
                sliderValue: Float(badgeHeight.rounded()),
                onSliderChanged: { [weak self] newValue in
                    self?.splitBadgeHeightConstraint.constant = CGFloat(newValue)
                    self?.cashbackBadgeHeightConstraint.constant = CGFloat(newValue)
                    self?.badgeHeight = CGFloat(newValue)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellAlign") as! SegmentCell<YPBadgeModel.Align>
            cell.configure(
                title: "Align",
                onSegmentChanged: { [weak self] newValue in
                    self?.viewModel.align = newValue
                }
            )
            return cell
        case (1, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellTheme") as! SegmentCell<YPTheme>
            cell.configure(
                title: "Theme",
                onSegmentChanged: { [weak self] newValue in
                    self?.viewModel.theme = newValue
                }
            )
            return cell
        case (2, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellCashbackColor") as! SegmentCell<YPBadgeModel.CashbackColor>
            cell.configure(
                title: "Color",
                onSegmentChanged: { [weak self] newValue in
                    self?.viewModel.cashbackColor = newValue
                }
            )
            return cell
        case (2, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellCashbackVariant") as! SegmentCell<YPBadgeModel.CashbackVariant>
            cell.configure(
                title: "Variant",
                onSegmentChanged: { [weak self] newValue in
                    self?.viewModel.cashbackVariant = newValue
                }
            )
            return cell
        case (3, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellSplitColor") as! SegmentCell<YPBadgeModel.SplitColor>
            cell.configure(
                title: "Color",
                onSegmentChanged: { [weak self] newValue in
                    self?.viewModel.splitColor = newValue
                }
            )
            return cell
        case (3, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellSplitVariant") as! SegmentCell<YPBadgeModel.SplitVariant>
            cell.configure(
                title: "Variant",
                onSegmentChanged: { [weak self] newValue in
                    self?.viewModel.splitVariant = newValue
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
            "General"
        case 2:
            "Cashback"
        case 3: 
            "Split"
        default:
            nil
        }
    }
}
