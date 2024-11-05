//
//  CartViewModel.swift
//
//
//  Created by Angelina Reshetnikova on 02.11.2024.
//

import Foundation
import UIKit
import YandexPaySDK

final class CartViewModel {
  private let navigationController: UINavigationController
  private var form: YandexPayForm?
  private var paymentURLService: PaymentURLService = PaymentURLService()
  var cart: [Product]


  var cartTotal: Decimal {
    cart.map { $0.amount }.reduce(0, +)
  }

  var widgetModel: YPCheckoutWidgetModel {
    YPCheckoutWidgetModel(
      amount: cartTotal,
      currency: .rub,
      style: .fullBox,
      appearance: .init()
    )
  }

  init(form: YandexPayForm? = nil, navigationController: UINavigationController, cart: [Product]) {
    self.form = form
    self.navigationController = navigationController
    self.cart = cart
  }

  func close() {
    navigationController.popViewController(animated: true)
  }

  func openPayForm() {
    // Проверьте, что SDK проинициализирован
    guard YandexPaySDKApi.isInitialized else {
      assertionFailure("YandexPaySDK is not initialized.")
      return
    }

    // Скрываем прошлую платежную форму, если она была
    form?.dismiss(animated: false, completion: nil)

    // Создайте платежную форму и передайте туда paymentUrl
    Task { @MainActor in
      if let paymentUrl = await getPaymentUrl() {
        form = YandexPaySDKApi.instance.createYandexPayForm(paymentURL: paymentUrl, delegate: self)
      }

      if let topController = navigationController.topViewController {
        form?.present(from: topController, animated: true, completion: nil)
      }
    }
  }

  func getPaymentUrl() async -> URL? {
    if let paymentUrl = paymentURLService.paymentURL {
      return URL(string: paymentUrl)
    } else if let responce = await paymentURLService.requestLink(
      preferredPaymentMethods: Constants.preferredPaymentMethods,
      cartItems: cart,
      amount: cartTotal
    ) {
      if let paymentURL = paymentURLService.paymentURL {
        return URL(string: paymentURL)
      } else {
        makeAlert(with: "Error", message: responce.reasonCode)
      }
    }
    return nil
  }
}

// MARK: - YandexPayFormDelegate

extension CartViewModel: YandexPayFormDelegate {
  func yandexPayForm(
    _ form: YandexPaySDK.YandexPayForm,
    data: YandexPaySDK.YPYandexPayPaymentData,
    didCompletePaymentWithResult result: YandexPaySDK.YPYandexPayPaymentResult) {
      let title: String
      let message: String
      switch result {
      case .succeeded:
        title = "Success!"
        message = "Payment successfuly proceeded."
      case .cancelled:
        title = "Cancelled!"
        message = "Payment has been cancelled by user."
      case .failed:
        fallthrough
      @unknown default:
        title = "Error!"
        message = "An error occured while payment processing."
      }
      makeAlert(with: title, message: message)
    }
}

extension CartViewModel {
  func makeAlert(with title: String, message: String? = nil) {
    DispatchQueue.main.async {
      let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
      controller.addAction(UIAlertAction(title: "OK", style: .default))
      self.navigationController.present(controller, animated: true)
    }
  }
}

extension CartViewModel {
  enum Constants {
    static let preferredPaymentMethods: [YPAvailablePaymentMethod] = [.card, .split]
    static let amount: Decimal = 1000
  }
}
