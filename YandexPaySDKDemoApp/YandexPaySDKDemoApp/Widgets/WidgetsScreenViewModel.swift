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
    case bnplPreview

    static var allCasesTitles: [String] = WidgetType.allCases.map { $0.rawValue }
  }
  
  // MARK: - Public and internal properties

  @Published var widgetType: WidgetType = .item
  @Published var amount: String = "1000"

  @Published var style: YPItemWidgetModel.Style = .fullSize
  @Published var appearance: YPItemWidgetModel.Appearance = .init()

  @Published var infoWidgetCheckoutStyle: YPCheckoutWidgetModel.Style = .fullBox
  @Published var infoWidgetCheckoutAppearance: YPCheckoutWidgetModel.Appearance = .init()

  @Published var bnplPreviewWidgetAppearance: YPBnplPreviewWidgetModel.Appearance = .init()
  @Published var bnplPreviewWidgetHeaderAppearance: YPBnplPreviewWidgetModel.HeaderStyle = .standard
  @Published var bnplPreviewWidgetBackgroundColor: Color = .green {
    didSet {
      bnplPreviewWidgetAppearance.background = .custom(bnplPreviewWidgetBackgroundColor)
    }
  }
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

// MARK: - YandexPayBnplPreviewWidgetDelegate

extension WidgetsScreenViewModel: YandexPayBnplPreviewWidgetDelegate {
  func onYandexPayCheckoutButtonClick(data: YandexPaySDK.YandexPayBnplPreviewWidgetData) {
    toastText = "Split for \(data.splitMonthCount) months was chosen by the user"
    showToast.toggle()
  }
  func onYandexPayHeaderClick() {
    toastText = "Split main description"
    showToast.toggle()
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

extension YPBnplPreviewWidgetModel.Appearance.Background: Titelable {
  public static let allCases: [YPBnplPreviewWidgetModel.Appearance.Background] = [.default, .transparent]
  static let allCasesTitles: [String] = allCases.map { $0.title }

  private var title: String {
    switch self {
    case .transparent:
      "Transparent"
    case .default:
      "Default"
    case .custom:
      "Custom"
    @unknown default:
      ""
    }
  }
}

extension YPBnplPreviewWidgetModel.Appearance.WidgetSize: Titelable {
  public static let allCases: [YPBnplPreviewWidgetModel.Appearance.WidgetSize] = [.small, .medium]
  static let allCasesTitles: [String] = allCases.map { $0.title }

  private var title: String {
    switch self {
    case .medium:
      "medium"
    case .small:
      "small"
    @unknown default:
      ""
    }
  }
}

extension YPBnplPreviewWidgetModel.HeaderStyle: Titelable {
  public static let allCases: [YPBnplPreviewWidgetModel.HeaderStyle] = [.minified, .standard, .standardWithCustomAction]
  static let allCasesTitles: [String] = allCases.map { $0.rawValue }
}
