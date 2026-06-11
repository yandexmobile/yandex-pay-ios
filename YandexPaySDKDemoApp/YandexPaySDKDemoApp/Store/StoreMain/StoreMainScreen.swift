//
//  StoreMainScreen.swift
//
//
//  Created by Angelina Reshetnikova on 01.11.2024.
//

import Foundation
import SwiftUI
import YandexPaySDK

struct StoreMainScreen: View {
  @ObservedObject private var viewModel: StoreMainScreenViewModel

  init(viewModel: StoreMainScreenViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    VStack(spacing: 0) {
      navigationBar
      ScrollView(showsIndicators: false) {
        banner
          .padding(.top, 20)
        HStack {
          Text("Популярное")
            .font(.system(size: 22))
            .padding(.vertical, 20)
            .multilineTextAlignment(.leading)
          Spacer()
        }
        products
        Spacer()
      }
      .padding(.horizontal, 20)
    }
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
      Spacer()
        .frame(width: 16)
      Image("close")
        .resizable()
        .frame(width: 24, height: 24)
        .onTapGesture {
          viewModel.close()
        }
    }
    .padding(.vertical, 17)
    .padding(.horizontal, 20)
    .background(.background)
    .shadow(color: .secondary.opacity(0.3), radius: 2.5, x: 0, y: 2)
  }

  var banner: some View {
    VStack(spacing: 0) {
      Image("payLogo")
        .padding(.vertical, 30)
      Text("Покупки выгоднее с Яндекс Пэй")
        .font(.system(size: 32, weight: .bold))
        .foregroundColor(.black)
        .multilineTextAlignment(.center)
        .padding(.bottom, 8)
      Text("Сплитуйте, платите любыми картами и получайте кешбэк баллами Плюса — дополнительно к кешбэку вашего банка")
        .font(.system(size: 16))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.bottom, 20)
      Image("PayPlusSplit")
        .resizable()
        .frame(width: 343, height: 256)
    }
    .background(LinearGradient(
      gradient: Gradient(colors: [Color("bannerStartPointColor"), Color("bannerEndPointColor")]),
      startPoint: .leading,
      endPoint: .trailing)
    )
    .cornerRadius(16)
  }

  var products: some View {
    ForEach(viewModel.productPairs, id: \.self[0].title) { pair in
      HStack(spacing: 0) {
        productCard(pair[0])
        Spacer()
        if pair.count == 2 {
          productCard(pair[1])
        }
      }
    }
    .padding(.bottom, 11)
  }

  func productCard(_ product: Product) -> some View {
    VStack(spacing: 8) {
      product.image
        .resizable()
        .frame(width: 166, height: 158)
      VStack(alignment: .leading, spacing: 8) {
        Text(product.title)
          .font(.system(size: 16))
          .lineLimit(2)
          .frame(height: 42)
        Text(product.amount.description + " ₽")
          .font(.system(size: 22))
        Group {
          YandexPaySDKApi.instance.createBadgeView(model: viewModel.splitModel(amount: product.amount))
          YandexPaySDKApi.instance.createBadgeView(model: viewModel.cashbackModel(amount: product.amount))
        }
        .frame(height: 14)
        addInCartButtont(product)
        .cornerRadius(8)
        .onTapGesture {
          viewModel.addInCart(product: product)
        }
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 20)
    }
    .frame(width: 166)
    .background(.productBackground)
    .cornerRadius(16)
    .onTapGesture {
      viewModel.open(product: product)
    }
  }

  @ViewBuilder
  func addInCartButtont(_ product: Product) -> some View {
    if viewModel.cart.contains(where: { $0 == product }) {
      HStack {
        Spacer()
        Text("В корзине")
          .font(.system(size: 12))
          .foregroundStyle(.secondary)
        Spacer()
      }
      .frame(height: 36)
      .background(.background)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(
            .secondary,
            lineWidth: 1.5
          )
      )
    } else {
      HStack {
        Spacer()
        Text("В корзину")
          .font(.system(size: 12))
        Spacer()
      }
      .frame(height: 36)
      .background(.background)
    }
  }
}
