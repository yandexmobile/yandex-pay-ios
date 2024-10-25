//
//  BadgesScreenViewModel.swift
//  YandexPaySDKSampleApp
//
//  Created by Matvey Kravtsov on 19.04.24.
//  Copyright © 2024 Yandex. All rights reserved.
//

import Combine
import Foundation
import YandexPaySDK

final class BadgesScreenViewModel: ObservableObject {
  @Published var amount: String = "1000"
  @Published var theme: YPTheme = .system
  @Published var align: YPBadgeModel.Align = .left
  @Published var cashbackColor: YPBadgeModel.CashbackColor = .primary
  @Published var cashbackVariant: YPBadgeModel.CashbackVariant = .default
  @Published var splitColor: YPBadgeModel.SplitColor = .primary
  @Published var splitVariant: YPBadgeModel.SplitVariant = .detailed

  private var amountNumber: Decimal {
    Decimal(string: amount, locale: Locale.current) ?? .zero
  }

  var cashbackModel: YPBadgeModel {
    YPBadgeModel(
      amount: amountNumber,
      currency: .rub,
      theme: theme,
      align: align,
      type: .cashback(color: cashbackColor, variant: cashbackVariant)
    )
  }

  var splitModel: YPBadgeModel {
    YPBadgeModel(
      amount: amountNumber,
      currency: .rub,
      theme: theme,
      align: align,
      type: .split(color: splitColor, variant: splitVariant)
    )
  }
}

extension YPBadgeModel.Align: Titelable {
    public static let allCases: [YPBadgeModel.Align] = [.left, .center, .right]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPBadgeModel.CashbackColor: Titelable {
    public static let allCases: [YPBadgeModel.CashbackColor] = [.primary, .grey, .transparent]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPBadgeModel.CashbackVariant: Titelable {
    public static let allCases: [YPBadgeModel.CashbackVariant] = [.default, .compact]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPBadgeModel.SplitColor: Titelable {
    public static let allCases: [YPBadgeModel.SplitColor] = [.primary, .green, .grey, .transparent]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPBadgeModel.SplitVariant: Titelable {
    public static let allCases: [YPBadgeModel.SplitVariant] = [.simple, .detailed]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}
