//
//  WidgetsScreen.swift
//  YandexPaySDKSampleApp
//
//  Created by Ilia Cherkasov on 07.05.2024.
//  Copyright © 2024 Yandex. All rights reserved.
//

import SwiftUI
import YandexPaySDK

struct WidgetsScreen: View {

  @ObservedObject private var viewModel: WidgetsScreenViewModel
  @State private var widgetWidth: CGFloat = Constants.defaultWidgetWidth

  init(viewModel: WidgetsScreenViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
      NavigationStack {
          ZStack {
              Rectangle()
                  .foregroundColor(Color("blue"))
                  .ignoresSafeArea(.all)
              VStack {
                  switch viewModel.widgetType {
                  case .item:
                      YandexPaySDKApi.instance.createItemWidgetView(
                        model: YPItemWidgetModel(
                            amount: Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero,
                            currency: .rub,
                            style: viewModel.style,
                            appearance: viewModel.appearance
                        ),
                        presentationContextProvider: viewModel
                      )
                      .frame(width: widgetWidth)
                  case .checkout:
                      YandexPaySDKApi.instance.createCheckoutWidgetView(
                        model: .init(
                            amount: Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero,
                            currency: .rub,
                            style: viewModel.infoWidgetCheckoutStyle,
                            appearance: viewModel.infoWidgetCheckoutAppearance
                        )
                      )
                      .frame(width: widgetWidth)
                  }
                  List {
                      sizeSection
                      typeSection
                      switch viewModel.widgetType {
                      case .item:
                          infoWidgetGeneralSection
                          infoWidgetAppearanceSection
                      case .checkout:
                          infoCheckoutWidgetGeneralSection
                          infoCheckoutWidgetAppearanceSection
                      }
                  }
              }
          }
      }
      .navigationTitle("Widgets")
      .navigationBarTitleDisplayMode(.inline)
  }

  private var sizeSection: some View {
    Section {
      HStack {
        Text("Width")
        Slider(
          value: $widgetWidth,
          in: 280...Constants.defaultWidgetWidth,
          step: 1
        ) {
          EmptyView()
        }
        Text(widgetWidth.formatted())
      }
    } header: {
      Text("Size")
    }
  }

  private var typeSection: some View {
    Section {
      Picker("Type", selection: $viewModel.widgetType) {
        Text("Item").tag(WidgetsScreenViewModel.WidgetType.item)
        Text("Checkout").tag(WidgetsScreenViewModel.WidgetType.checkout)
      }
    } header: {
      Text("Type")
    }
  }

  private var infoWidgetGeneralSection: some View {
    Section {
      HStack {
        Text("Amount")
        TextField("Amount", text: $viewModel.amount) {
          viewModel.updateViewModels()
        }
        .multilineTextAlignment(.trailing)
        .keyboardType(.decimalPad)
      }
      Picker("Style", selection: $viewModel.style) {
        Text("Full size").tag(YPItemWidgetModel.Style.fullSize)
        Text("Split").tag(YPItemWidgetModel.Style.split)
        Text("Cashback").tag(YPItemWidgetModel.Style.cashback)
      }
    } header: {
      Text("General")
    }
  }

  private var infoCheckoutWidgetGeneralSection: some View {
    Section {
      HStack {
        Text("Amount")
        TextField("Amount", text: $viewModel.amount) {
          viewModel.updateViewModels()
        }
        .multilineTextAlignment(.trailing)
        .keyboardType(.decimalPad)
      }
      Picker("Style", selection: $viewModel.infoWidgetCheckoutStyle) {
        Text("Cashback Only").tag(
          YPCheckoutWidgetModel.Style.cashbackOnly
        )
        Text("Split Only").tag(
          YPCheckoutWidgetModel.Style.splitOnly
        )
        Text("Full Box").tag(
          YPCheckoutWidgetModel.Style.fullBox
        )
      }
    } header: {
      Text("General")
    }
  }

  private var infoWidgetAppearanceSection: some View {
    Section {
      Picker("Theme", selection: $viewModel.appearance.theme) {
        Text("System").tag(
          YPTheme.system
        )
        Text("Light").tag(
          YPTheme.light
        )
        Text("Dark").tag(
          YPTheme.dark
        )
      }
      Toggle(isOn: $viewModel.appearance.isTransparent) {
        Text("Transparent")
      }
    } header: {
      Text("Appearance")
    }
  }

  private var infoCheckoutWidgetAppearanceSection: some View {
    Section {
      Picker("Theme", selection: $viewModel.infoWidgetCheckoutAppearance.theme) {
        Text("System").tag(
          YPTheme.system
        )
        Text("Light").tag(
          YPTheme.light
        )
        Text("Dark").tag(
          YPTheme.dark
        )
      }
    } header: {
      Text("Appearance")
    }
  }
}

private enum Constants {
  static let screenWidth = UIScreen.main.bounds.size.width
  static let padding: CGFloat = 16
  static var defaultWidgetWidth: CGFloat {
    screenWidth - 2 * padding
  }
}
