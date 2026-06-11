//
//  StoreMainScreenViewModel.swift
//
//
//  Created by Angelina Reshetnikova on 01.11.2024.
//

import Foundation
import YandexPaySDK
import SwiftUI

final class StoreMainScreenViewModel: ObservableObject {
  private var navigationController: UINavigationController

  @Published var products: [Product] = StoreMainScreenViewModel.staticProducts
  @Published var cart: [Product] = []

  var productPairs: [[Product]] {
    chunkArray(array: products, chunkSize: 2)
  }

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func cashbackModel(amount: Decimal) -> YPBadgeModel {
    YPBadgeModel(
      amount: amount,
      currency: .rub,
      theme: .system,
      align: .left,
      type: .cashback(color: .primary, variant: .default)
    )
  }

  func splitModel(amount: Decimal) -> YPBadgeModel {
    YPBadgeModel(
      amount: amount,
      currency: .rub,
      theme: .system,
      align: .left,
      type: .split(color: .primary, variant: .simple)
    )
  }

  func addInCart(product: Product) {
    if !checkProductInCart(product: product) {
      cart.append(product)
    } else {
      cart.removeAll(where: { $0 == product })
    }
  }

  func checkProductInCart(product: Product) -> Bool {
    cart.contains(where: { $0 == product })
  }

  func open(product: Product) {
    let viewModel = ProductViewModel(
      product: product,
      cart: cart,
      navigationController: navigationController
    ) { [weak self] hasInCart in
      guard let self else { return }
      if hasInCart {
        if !checkProductInCart(product: product) {
          cart.append(product)
        }
      } else {
        cart.removeAll(where: { $0 == product })
      }
    }
    navigationController.pushViewController(
      UIHostingController(rootView: ProductView(viewModel: viewModel)),
      animated: true
    )
  }

  func close() {
    navigationController.popViewController(animated: true)
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

extension StoreMainScreenViewModel {
  func chunkArray<T>(array: [T], chunkSize: Int) -> [[T]] {
    return stride(from: 0, to: array.count, by: chunkSize).map {
      Array(array[$0..<min($0 + chunkSize, array.count)])
    }
  }
}

extension StoreMainScreenViewModel {
  static let staticProducts: [Product] = [
    .init(
      title: "Уточка Гжель",
      description: "Резиновая уточка, расписанная под Гжель - это оригинальный и стильный аксессуар для дома. Уточка имеет яркий и красивый дизайн, который будет отлично смотреться в любом интерьере",
      amount: 1000,
      image: Image("duck_00")
    ),
    .init(
      title: "Уточка-модница",
      description: "Резиновая уточка в шляпе - это забавный и оригинальный аксессуар для вашего дома или офиса. Уточка имеет шляпу в виде цилиндра, которая придает ей особый шарм и делает ее еще более привлекательной",
      amount: 1200,
      image: Image("duck_01")
    ),
    .init(
      title: "Уточка-космонавт",
      description: "Резиновая уточка в виде космонавта - это забавный и оригинальный подарок для любителей космических приключений. Уточка может использоваться как игрушка для ванны или как декор для дома или офиса",
      amount: 800,
      image: Image("duck_02")
    ),
    .init(
      title: "Уточка Хохлома",
      description: "Перед вами уникальная уточка, которая станет отличным подарком для любого человека. Она идеально подходит для украшения интерьера и создания атмосферы уюта и тепла в вашем доме",
      amount: 2000,
      image: Image("duck_03")
    ),
    .init(
      title: "Уточка-самурай",
      description: "Это не просто игрушка, это настоящий самурай! Он сделан из высококачественного материала, который не только выглядит реалистично, но и обладает высокой прочностью и долговечностью",
      amount: 1600,
      image: Image("duck_04")
    ),
    .init(
      title: "Уточка Стимпанк",
      description: "Если вы ищете необычный и оригинальный подарок, то резиновая утка-стимпанк-робот – это именно то, что вам нужно. Она станет прекрасным подарком для близких, друзей или коллег",
      amount: 1800,
      image: Image("duck_05")
    )
  ]
}
