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
            // Создайте нужный виджет
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
          case .ultimate:
            YandexPaySDKApi.instance.createUltimateWidgetView(
              model: YPUltimateWidgetModel(
                amount: Decimal(string: viewModel.amount, locale: Locale.current) ?? .zero,
                currency: .rub,
                style: viewModel.ultimateWidgetStyle,
                appearance: viewModel.ultimateWidgetAppearance,
                header: viewModel.ultimateWidgetHeaderAppearance
              ),
              presentationContextProvider: viewModel,
              delegate: viewModel
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
            case .ultimate:
              ultimateWidgetGeneralSection
              ultimateWidgetAppearanceSection
              ultimateWidgetControlsSection
            }
          }
        }
        .alert(isPresented: $viewModel.showToast) {
          Alert(
            title: Text("YandexPayMerchant"),
            message: Text(viewModel.toastText),
            dismissButton: .cancel()
          )
        }
      }
    }
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
        Text("Ultimate").tag(WidgetsScreenViewModel.WidgetType.ultimate)
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
  
  private var ultimateWidgetGeneralSection: some View {
    Section {
      HStack {
        Text("Amount")
        TextField("Amount", text: $viewModel.amount) {
          viewModel.updateViewModels()
        }
        .multilineTextAlignment(.trailing)
        .keyboardType(.decimalPad)
      }
      .multilineTextAlignment(.trailing)
      .keyboardType(.decimalPad)
      Picker("Style", selection: $viewModel.ultimateWidgetStyle) {
        Text("Cashback").tag(
          YPUltimateWidgetModel.Style.cashback
        )
        Text("Split").tag(
          YPUltimateWidgetModel.Style.split
        )
        Text("Full Size").tag(
          YPUltimateWidgetModel.Style.fullSize
        )
      }
    } header: {
      Text("General")
    }
  }
  
  private var ultimateWidgetAppearanceSection: some View {
    Section {
      HStack {
        Text("Radius: \(Int(viewModel.ultimateWidgetAppearance.radius.rounded()))")
        Slider(value: $viewModel.ultimateWidgetAppearance.radius.animation(.easeIn), in: 0...32)
      }
      Picker("Theme", selection: $viewModel.ultimateWidgetAppearance.theme) {
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
      Picker("Background", selection: $viewModel.ultimateWidgetAppearance.background) {
        Text("Default").tag(
          YPUltimateWidgetModel.Appearance.Background.default
        )
        Text("Transparent").tag(
          YPUltimateWidgetModel.Appearance.Background.transparent
        )
        Text("Light").tag(
          YPUltimateWidgetModel.Appearance.Background.light
        )
      }
      Picker("Widget Size", selection: $viewModel.ultimateWidgetAppearance.size) {
        Text("S").tag(YPUltimateWidgetModel.Appearance.WidgetSize.small)
        Text("M").tag(YPUltimateWidgetModel.Appearance.WidgetSize.medium)
      }
      Toggle("Outline", isOn: $viewModel.ultimateWidgetAppearance.hasOutline)
      Toggle("Padding", isOn: $viewModel.ultimateWidgetAppearance.hasPadding)
    } header: {
      Text("Appearance")
    }
  }
  
  private var ultimateWidgetControlsSection: some View {
    Section {
      VStack(alignment: .leading, spacing: 0) {
        Text("Select header style")
        Picker("Select header style", selection: $viewModel.ultimateWidgetHeaderAppearance) {
          Text("Minified - tiny header")
            .tag(YPUltimateWidgetModel.HeaderStyle.minified)
          Text("Standard - yandex landing")
            .tag(YPUltimateWidgetModel.HeaderStyle.standard)
          Text("Custom Action - merchant's action")
            .tag(YPUltimateWidgetModel.HeaderStyle.standardWithCustomAction)
        }
        .pickerStyle(.wheel)
        .labelsHidden()
      }
      Toggle(
        "Show button",
        isOn: $viewModel.ultimateWidgetAppearance.hasCheckoutButton
          .animation(.easeInOut)
      )
    } header: {
      Text("Controls")
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
