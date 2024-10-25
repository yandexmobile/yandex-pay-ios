//
//  BadgesScreen.swift
//  YandexPaySDKSampleApp
//
//  Created by Matvey Kravtsov on 19.04.24.
//  Copyright © 2024 Yandex. All rights reserved.
//

import SwiftUI
import YandexPaySDK

struct BadgesScreen: View {
    @Environment(\.colorScheme) private var colorScheme
    @ObservedObject private var viewModel: BadgesScreenViewModel

    @State private var badgeHeight: CGFloat = 20

    init(viewModel: BadgesScreenViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(viewModel.theme == .dark ? Color("blueDark") : Color("blue"))
                    .ignoresSafeArea(.all)
                VStack(spacing: 8) {
                    Group {
                        YandexPaySDKApi.instance.createBadgeView(model: viewModel.cashbackModel)
                        YandexPaySDKApi.instance.createBadgeView(model: viewModel.splitModel)
                    }
                    .frame(height: badgeHeight)
                    .padding(.horizontal, 16)
                    Spacer()
                    List {
                        sizeSection
                        generalSection
                        cashbackSection
                        splitSection
                    }
                }
                .padding(.top, 16)
            }
        }
        .navigationTitle("Bagdes")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var sizeSection: some View {
        Section {
            HStack {
                Text("Height")
                Slider(value: $badgeHeight, in: 10...40, step: 1) {
                    EmptyView()
                }
                Text(badgeHeight.formatted())
            }
        } header: {
            Text("Size")
        }
    }

    private var generalSection: some View {
        Section {
            HStack {
                Text("Amount")
                TextField("Amount", text: $viewModel.amount)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Picker("Align", selection: $viewModel.align) {
                Text("Left").tag(YPBadgeModel.Align.left)
                Text("Center").tag(YPBadgeModel.Align.center)
                Text("Right").tag(YPBadgeModel.Align.right)
            }
            Picker("Theme", selection: $viewModel.theme) {
                Text("System").tag(YPTheme.system)
                Text("Light").tag(YPTheme.light)
                Text("Dark").tag(YPTheme.dark)
            }
        } header: {
            Text("General")
        }
    }

    private var cashbackSection: some View {
        Section {
            Picker("Color", selection: $viewModel.cashbackColor) {
                Text("Primary").tag(YPBadgeModel.CashbackColor.primary)
                Text("Grey").tag(YPBadgeModel.CashbackColor.grey)
                Text("Transparent").tag(YPBadgeModel.CashbackColor.transparent)
            }
            Picker("Variant", selection: $viewModel.cashbackVariant) {
                Text("Default").tag(YPBadgeModel.CashbackVariant.default)
                Text("Compact").tag(YPBadgeModel.CashbackVariant.compact)
            }
        } header: {
            Text("Cashback")
        }
    }

    private var splitSection: some View {
        Section {
            Picker("Color", selection: $viewModel.splitColor) {
                Text("Primary").tag(YPBadgeModel.SplitColor.primary)
                Text("Green").tag(YPBadgeModel.SplitColor.green)
                Text("Grey").tag(YPBadgeModel.SplitColor.grey)
                Text("Transparent").tag(YPBadgeModel.SplitColor.transparent)
            }
            Picker("Variant", selection: $viewModel.splitVariant) {
                Text("Simple").tag(YPBadgeModel.SplitVariant.simple)
                Text("Detailed").tag(YPBadgeModel.SplitVariant.detailed)
            }
        } header: {
            Text("Split")
        }
    }

    private var modelColorScheme: ColorScheme {
        switch viewModel.theme {
        case .system:
            colorScheme
        case .light:
                .light
        case .dark:
                .dark
        }
    }
}
