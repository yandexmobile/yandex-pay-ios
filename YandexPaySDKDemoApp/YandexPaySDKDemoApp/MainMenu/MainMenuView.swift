//
//  MainMenuView.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 11.10.2024.
//

import SwiftUI

struct MainMenuView: View {
  @ObservedObject private var viewModel: MainMenuViewModel
  
  init(viewModel: MainMenuViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        Image("logoPay")
          .frame(height: 28)
        makeRow(for: MainMenuViewModel.Integration.demoApp)
        HStack {
          Rectangle()
            .frame(height: 1)
          Text("Варианты интеграций")
            .font(.system(size: 24, weight: .bold))
            .padding(.vertical, 20)
            .fixedSize()
          Rectangle()
            .frame(height: 1)
        }
        HStack(spacing: 28) {
          ForEach(MainMenuViewModel.Framework.allCases, id: \.rawValue) { framework in
            makeButton(for: framework)
          }
        }
        .padding(.vertical, 20)
        ForEach(MainMenuViewModel.Integration.allCases.dropLast(), id: \.rawValue) { method in
          makeRow(for: method)
        }
        Text("O приложении")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.secondary)
          .padding(4)
        Text("Версия SDK \(viewModel.sdkVersion)")
          .font(.system(size: 12))
          .foregroundColor(.secondary)
        Spacer()
      }
      .padding(.horizontal, 36)
    }
    .navigationBarHidden(false)
  }
  
  private func makeRow(for method: MainMenuViewModel.Integration) -> some View {
    ZStack {
      Rectangle()
        .frame(height: 120)
        .cornerRadius(20)
        .foregroundColor(method.color)
      HStack(spacing: 12) {
        Text(method.rawValue)
          .font(.system(size: 18, weight: .semibold))
          .padding(.top, 28)
        Spacer()
        method.iconView
      }
      .padding(.horizontal, 20)
    }
    .onTapGesture {
      viewModel.routeTo(integration: method)
    }
  }
  
  private func makeButton(for framework: MainMenuViewModel.Framework) -> some View {
    Button(action: {
      viewModel.selectedFramework = framework
    }, label: {
      Text(framework.rawValue)
        .foregroundStyle(.black)
    })
    .frame(width: 140, height: 36)
    .cornerRadius(20)
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .stroke(
          .black.opacity(viewModel.selectedFramework == framework ? 1 : 0.3),
          lineWidth: viewModel.selectedFramework == framework ? 1.5 : 1
        )
    )
  }
}
