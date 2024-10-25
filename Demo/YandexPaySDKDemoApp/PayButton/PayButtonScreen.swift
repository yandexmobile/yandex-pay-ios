//
//  PayButtonView.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 14.10.2024.
//

import Foundation
import SwiftUI
import YandexPaySDK

struct PayButtonScreen: View {
    @Environment(\.colorScheme) private var colorScheme
    @ObservedObject private var viewModel: PayButtonViewModel

    @State private var butonWidth: CGFloat = 250

    init(viewModel: PayButtonViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                YandexPaySDKApi.instance.createButton(
                    model: viewModel.buttonModel,
                    paymentDataProvider: viewModel,
                    presentationContextProvider: viewModel,
                    delegate: viewModel
                )
                .frame(width: butonWidth)
                .padding(.horizontal, 16)
                Spacer()
                List {
                    sizeSection
                    orderSection
                    generalSection
                }
            }
            .padding(.top, 16)
        }
        .navigationTitle("Pay Button")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var sizeSection: some View {
        Section {
                HStack {
                    Text("Width")
                    Slider(value: $butonWidth, in: 100...360, step: 1) {
                        EmptyView()
                    }
                    Text(butonWidth.formatted())
                }
                HStack {
                    Text("Corner radius")
                    Slider(value: $viewModel.cornerRadius, in: 0...30, step: 1) {
                        EmptyView()
                    }
                    Text($viewModel.cornerRadius.wrappedValue.formatted())
                }
        } header: {
            Text("Size")
        }
    }

    private var orderSection: some View {
        Section {
            HStack {
                Text("Amount")
                TextField("Amount", text: $viewModel.amount)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            HStack {
                Text("Currency code")
                TextField("Currency", text: $viewModel.currencyCodeString)
                    .multilineTextAlignment(.trailing)
            }
            Toggle(isOn: $viewModel.isSplitAvailable) {
              Text("Split payment available")
            }
            Toggle(isOn: $viewModel.isCardAvailable) {
              Text("Card payment available")
            }
        } header: {
            Text("Order")
        }
    }

    private var generalSection: some View {
        Section {
            Picker("Theme", selection: $viewModel.theme) {
                Text("System").tag(YPTheme.system)
                Text("Light").tag(YPTheme.light)
                Text("Dark").tag(YPTheme.dark)
            }
            Toggle(isOn: $viewModel.isBordered) {
              Text("Border")
            }
        } header: {
            Text("Appearance")
        }
    }
}
