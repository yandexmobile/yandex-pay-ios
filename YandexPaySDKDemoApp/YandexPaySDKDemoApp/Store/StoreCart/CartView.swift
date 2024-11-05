//
//  CartView.swift
//
//
//  Created by Angelina Reshetnikova on 02.11.2024.
//

import Foundation
import SwiftUI
import YandexPaySDK

struct CartView: View {
  private let viewModel: CartViewModel

  init(viewModel: CartViewModel) {
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
          Text("Вернуться к покупкам")
            .font(.system(size: 14))
          Spacer()
        }
        .padding(.top, 20)
        .foregroundColor(.secondary)
        .onTapGesture {
          viewModel.close()
        }
        HStack {
          Text("Корзина")
            .font(.system(size: 22))
            .multilineTextAlignment(.leading)
          Spacer()
        }
        if !viewModel.cart.isEmpty {
          LazyVStack(spacing: 0) {
            ForEach(Array(viewModel.cart.enumerated()), id: \.offset) { number, product in
              productCard(product)
              if number != viewModel.cart.count - 1 {
                Divider()
                  .background(.secondary)
                  .padding(.vertical, 20)
              }
            }
          }
          .padding(.vertical, 40)
        } else {
          VStack(spacing: 16) {
            Text("Здесь пока пусто")
              .font(.system(size: 20))
              .foregroundColor(.secondary)
            Text("Вернуться к покупкам")
              .font(.system(size: 14))
              .foregroundColor(.primary)
              .onTapGesture {
                viewModel.close()
              }
          }
          .padding(.vertical, 100)
        }
        widgetView
        Spacer()
        PaymentSystemsView()
      }
      .padding(.horizontal, 16)
    }
    .background(.background)
    .navigationBarHidden(true)
  }

  var navigationBar: some View {
    HStack {
      Image("duckStoreLogo")
        .resizable()
        .frame(width: 116, height: 20)
      Spacer()
    }
    .padding(.vertical, 17)
    .padding(.horizontal, 20)
    .background(.background)
    .shadow(color: .secondary.opacity(0.3), radius: 2.5, x: 0, y: 2)
  }

  var widgetView: some View {
    VStack {
      VStack(spacing: 0) {
        VStack(alignment: .leading, spacing: 0) {
          Text("Ваш заказ")
            .font(.system(size: 24))
          twoTextsInLine(text1: "Товаров: \(viewModel.cart.count)", text2: viewModel.cartTotal.description + " ₽")
            .font(.system(size: 12))
            .foregroundColor(.secondary)
            .padding(.top, 20)
          twoTextsInLine(text1: "Доставка", text2: "Бесплатно")
            .font(.system(size: 12))
            .foregroundColor(.secondary)
            .padding(.top, 8)
          twoTextsInLine(text1: "Итого", text2: viewModel.cartTotal.description + " ₽")
            .font(.system(size: 22))
            .foregroundColor(.primary)
            .padding(.top, 20)
        }
        if !viewModel.cart.isEmpty {
          YandexPaySDKApi.instance.createCheckoutWidgetView(
            model: viewModel.widgetModel
          )
          .padding(.top, 16)
          HStack {
            Spacer()
            Text("Перейти к оформлению")
              .font(.system(size: 16))
              .foregroundStyle(.white)
            Spacer()
          }
          .padding(16)
          .background(.buttonBackground)
          .cornerRadius(16)
          .onTapGesture {
            viewModel.openPayForm()
          }
          .padding(.top, 20)
        } else {
          HStack {
            Spacer()
            Text("Перейти к оформлению")
              .font(.system(size: 16))
              .foregroundStyle(.secondary)
            Spacer()
          }
          .padding(16)
          .background(.buttonBackground.opacity(0.5))
          .cornerRadius(16)
          .padding(.top, 20)
        }
      }
      .padding(20)
      .background(.productBackground)
      .cornerRadius(16)
    }
  }

  func productCard(_ product: Product) -> some View {
    HStack(alignment: .top, spacing: 20) {
      product.image
        .resizable()
        .frame(width: 102, height: 102)
        .cornerRadius(12)
      VStack(alignment: .leading) {
        Text(product.title)
          .font(.system(size: 16))
          .lineLimit(1)
          .fixedSize(horizontal: true, vertical: false)
        Spacer()
        Text(product.amount.description + " ₽")
          .font(.system(size: 16, weight: .medium))
          .padding(.top, 8)
      }
      .padding(.vertical, 8)
      Spacer()
    }
  }

  func twoTextsInLine(text1: String, text2: String) -> some View {
    HStack {
      Text(text1)
      Spacer()
      Text(text2)
    }
  }
}
