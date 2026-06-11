//
//  ProductView.swift
//
//
//  Created by Angelina Reshetnikova on 01.11.2024.
//

import Foundation
import SwiftUI
import YandexPaySDK

struct ProductView: View {
  @ObservedObject private var viewModel: ProductViewModel

  init(viewModel: ProductViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    VStack(spacing: 0) {
      navigationBar
      ScrollView(showsIndicators: false) {
        HStack(spacing: 6) {
          Image(systemName: "chevron.left")
            .resizable()
            .frame(width: 5, height: 10)
          Text("Вернуться на главную")
            .font(.system(size: 14))
          Spacer()
        }
        .padding(EdgeInsets(top: 20, leading: 12, bottom: 0, trailing: 12))
        .foregroundColor(.secondary)
        .onTapGesture {
          viewModel.close()
        }
        viewModel.product.image
          .resizable()
          .aspectRatio(contentMode: .fit)
        productCard
          .padding(16)
        PaymentSystemsView()
      }
    }
    .background(.productBackground)
    .navigationBarHidden(true)
  }

  var navigationBar: some View {
    HStack {
      Image("duckStoreLogo")
        .resizable()
        .frame(width: 116, height: 20)
      Spacer()
      Image("cart")
        .resizable()
        .frame(width: 24, height: 24)
        .onTapGesture {
          viewModel.openCart()
        }
    }
    .padding(.vertical, 16)
    .padding(.horizontal, 20)
    .background(.background)
    .shadow(color: .secondary.opacity(0.3), radius: 2.5, x: 0, y: 2)
  }

  var productCard: some View {
    VStack(spacing: 0) {
      VStack(alignment: .leading, spacing: 0) {
        Text(viewModel.product.title)
          .font(.system(size: 24))
        Text(viewModel.product.description)
          .font(.system(size: 12))
          .padding(.top, 8)
        Text(viewModel.product.amount.description + " ₽")
          .font(.system(size: 22, weight: .medium))
          .padding(.top, 20)
      }
      YandexPaySDKApi.instance.createItemWidgetView(
        model: viewModel.widgetModel,
        presentationContextProvider: viewModel
      )
      .padding(.top, 16)
      .padding(.bottom, 20)
      addInCartButton
      .cornerRadius(16)
      .onTapGesture {
        viewModel.addInCart()
      }
    }
    .padding(20)
    .background(.background)
    .cornerRadius(16)
  }

  @ViewBuilder
  var addInCartButton: some View {
    if viewModel.cart.contains(where: { $0 == viewModel.product }) {
      HStack {
        Spacer()
        Text("В корзине")
          .font(.system(size: 16))
          .foregroundStyle(.secondary)
        Spacer()
      }
      .padding(16)
      .background(.buttonBackground.opacity(0.3))
    } else {
      HStack {
        Spacer()
        Text("Добавить в корзину")
          .font(.system(size: 16))
          .foregroundStyle(.white)
        Spacer()
      }
      .padding(16)
      .background(.buttonBackground)
    }
  }
}
