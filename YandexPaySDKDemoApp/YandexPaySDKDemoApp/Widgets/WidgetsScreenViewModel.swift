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
  
  enum WidgetType: String, Titleable {
    case item
    case checkout
    case ultimate
    
    static var allCasesTitles: [String] = WidgetType.allCases.map { $0.rawValue }
  }
  
  // MARK: - Public and internal properties
  
  @Published var widgetType: WidgetType = .item
  @Published var amount: String = "1000"
  
  @Published var style: YPItemWidgetModel.Style = .fullSize
  @Published var appearance: YPItemWidgetModel.Appearance = .init()
  
  @Published var infoWidgetCheckoutStyle: YPCheckoutWidgetModel.Style = .fullBox
  @Published var infoWidgetCheckoutAppearance: YPCheckoutWidgetModel.Appearance = .init()

  @Published var ultimateWidgetStyle: YPUltimateWidgetModel.Style = .fullSize
  @Published var ultimateWidgetAppearance: YPUltimateWidgetModel.Appearance = .init()
  @Published var ultimateWidgetHeaderAppearance: YPUltimateWidgetModel.HeaderStyle = .standard

  @Published var showToast = false
  @Published var toastText = ""
  
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

// MARK: - YandexPayUltimateWidgetDelegate

extension WidgetsScreenViewModel: YandexPayUltimateWidgetDelegate {
  func onYandexPayUltimateCheckoutButtonClick(data: YandexPaySDK.YandexPayUltimateWidgetData) {
    toastText = "Split for \(data.splitMonthCount) months was chosen by the user"
    showToast.toggle()
  }
  func onYandexPayHeaderClick() {
    toastText = "Split main description"
    showToast.toggle()
  }
}

extension YPCheckoutWidgetModel.Style: Titleable, @retroactive CaseIterable {
  public static let allCases: [YPCheckoutWidgetModel.Style] = [.fullBox, .cashbackOnly, .splitOnly]
  static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPItemWidgetModel.Style: Titleable, @retroactive CaseIterable {
  public static let allCases: [YPItemWidgetModel.Style] = [.fullSize, .cashback, .split]
  static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}

extension YPUltimateWidgetModel.Appearance.Background: Titleable, @retroactive CaseIterable {
  public static let allCases: [YPUltimateWidgetModel.Appearance.Background] = [.default, .transparent]
  static let allCasesTitles: [String] = allCases.map { $0.title }
  
  private var title: String {
    switch self {
    case .transparent:
      "Transparent"
    case .default:
      "Default"
    case .light:
      "Light"
    @unknown default:
      "Unknown"
    }
  }
}

extension YPUltimateWidgetModel.Appearance.WidgetSize: Titleable, @retroactive CaseIterable {
  public static let allCases: [YPUltimateWidgetModel.Appearance.WidgetSize] = [.small, .medium]
  static let allCasesTitles: [String] = allCases.map { $0.title }
  
  private var title: String {
    switch self {
    case .medium:
      "medium"
    case .small:
      "small"
    @unknown default:
      "unknown"
    }
  }
}

extension YPUltimateWidgetModel.HeaderStyle: Titleable, @retroactive CaseIterable {
  public static let allCases: [YPUltimateWidgetModel.HeaderStyle] = [.minified, .standard, .standardWithCustomAction]
  static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}
