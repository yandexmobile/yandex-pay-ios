//
//  ProductViewModel.swift
//
//
//  Created by Angelina Reshetnikova on 01.11.2024.
//

import Foundation
import UIKit
import YandexPaySDK
import SwiftUI

final class ProductViewModel: ObservableObject {
  let product: Product
  @Published var cart: [Product]
  private let navigationController: UINavigationController
  private let onClose: (Bool) -> ()

  let amount: String = "1000"
  let style: YPItemWidgetModel.Style = .fullSize
  let appearance: YPItemWidgetModel.Appearance = .init()

  var widgetModel: YPItemWidgetModel {
    YPItemWidgetModel(
      amount: product.amount,
      currency: .rub,
      style: .fullSize,
      appearance: .init()
    )
  }

  init(
    product: Product,
    cart: [Product],
    navigationController: UINavigationController,
    onClose: @escaping (Bool) -> ()
  ) {
    self.product = product
    self.cart = cart
    self.navigationController = navigationController
    self.onClose = onClose
  }

  func close() {
    navigationController.popViewController(animated: true)
    onClose(cart.contains(where: { $0 == product }))
  }

  func addInCart() {
    if !cart.contains(where: { $0 == product }) {
      cart.append(product)
    } else {
      cart.removeAll(where: { $0 == product })
    }
  }

  func openCart() {
    navigationController.pushViewController(
      UIHostingController(rootView: CartView(
        viewModel: CartViewModel(
          navigationController: navigationController,
          cart: cart
        )
      )),
      animated: true
    )
  }
}

extension ProductViewModel: YPPresentationContextProviding {
  func anchorForPresentation() -> YandexPaySDK.YPPresentationContext {
    .keyWindow
  }
}
