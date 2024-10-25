//
//  WidgetsScreenViewModel.swift
//  YandexPaySDKSampleApp
//
//  Created by Ilia Cherkasov on 10.05.2024.
//  Copyright © 2024 Yandex. All rights reserved.
//

import SwiftUI
import YandexPaySDK

final class WidgetsScreenViewModel: ObservableObject {

  // MARK: - Nested type

    enum WidgetType: String, Titelable {
        case item
        case checkout

        static var allCasesTitles: [String] = WidgetType.allCases.map { $0.rawValue }
    }

  // MARK: - Public and internal properties

  @Published var widgetType: WidgetType = .item
  @Published var amount: String = "1000"

  @Published var style: YPItemWidgetModel.Style = .fullSize
  @Published var appearance: YPItemWidgetModel.Appearance = .init()

  @Published var infoWidgetCheckoutStyle: YPCheckoutWidgetModel.Style = .fullBox
  @Published var infoWidgetCheckoutAppearance: YPCheckoutWidgetModel.Appearance = .init()

  // MARK: - Public and internal methods

  func updateViewModels() {
    objectWillChange.send()
  }
}

// MARK: - YandexPayWidgetDataSource

extension WidgetsScreenViewModel: YPPresentationContextProviding {
  func anchorForPresentation() -> YandexPaySDK.YPPresentationContext {
    .keyWindow
  }
}

extension YPCheckoutWidgetModel.Style: Titelable {
    public static let allCases: [YPCheckoutWidgetModel.Style] = [.fullBox, .cashbackOnly, .splitOnly]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPItemWidgetModel.Style: Titelable {
    public static let allCases: [YPItemWidgetModel.Style] = [.fullSize, .cashback, .split]
    static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

