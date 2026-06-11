//
//  MainMenuViewModel.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 14.10.2024.
//

import Foundation
import SwiftUI
import UIKit
import YandexPaySDK

final class MainMenuViewModel: ObservableObject {
  @Published var selectedFramework: Framework = .UIKit
  private let navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func routeTo(integration: Integration) {
    switch (selectedFramework, integration) {
    case (.UIKit, .button):
      navigationController.pushViewController(PayButtonViewController(navigationController: navigationController), animated: true)
    case (.UIKit, .form):
      let controller = PayFormViewController()
      controller.viewModel = PayFormViewModel(navigationController: navigationController)
      navigationController.pushViewController(controller, animated: true)
    case (.UIKit, .badge):
      navigationController.pushViewController(BadgesViewController(), animated: true)
    case (.UIKit, .widget):
      navigationController.pushViewController(WidgetViewController(), animated: true)
    case (.SwiftUI, .button):
      navigationController.pushViewController(
        UIHostingController(rootView: PayButtonScreen(viewModel: PayButtonViewModel(navigationController: navigationController))),
        animated: true
      )
    case (.SwiftUI, .form):
      navigationController.pushViewController(
        UIHostingController(rootView: PayFormScreen(viewModel: .init(navigationController: navigationController))),
        animated: true
      )
    case (.SwiftUI, .badge):
      navigationController.pushViewController(
        UIHostingController(rootView: BadgesScreen(viewModel: .init())),
        animated: true
      )
    case (.SwiftUI, .widget):
      navigationController.pushViewController(
        UIHostingController(rootView: WidgetsScreen(viewModel: .init())),
        animated: true
      )
    case (_, .demoApp):
      navigationController.pushViewController(
        UIHostingController(rootView: StoreMainScreen(viewModel: .init(navigationController: navigationController))),
        animated: true
      )
    }
  }

  var sdkVersion: String {
    YandexPaySDKApi.currentVersion
  }
}

extension MainMenuViewModel {
  enum Framework: String, CaseIterable {
    case UIKit
    case SwiftUI
  }
  
  enum Integration: String, CaseIterable {
    case button = "Кнопочная интеграция"
    case form = "Бескнопочная интеграция"
    case badge = "Бейджи"
    case widget = "Виджеты"
    case demoApp = "Демо магазин с Яндекс Пэй"

    var iconView: some View {
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 120, height: 120)
        .padding(.bottom, 36)
    }
    
    var color: Color {
      switch self {
      case .button:
        Color("blue")
      case .form:
        Color("green")
      case .badge:
        Color("purple")
      case .widget:
        Color("orange")
      case .demoApp:
        Color("pink")
      }
    }
    
    private var image: Image {
      switch self {
      case .button:
        Image("payButton")
      case .form:
        Image("payForm")
      case .badge:
        Image("badge")
      case .widget:
        Image("widget")
      case .demoApp:
        Image("bag")
      }
    }
  }
}
