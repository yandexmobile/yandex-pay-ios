//
//  PayButtonViewController.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 14.10.2024.
//

import Foundation
import YandexPaySDK
import UIKit

final class PayButtonViewModel: ObservableObject {
  @Published var theme: YPTheme = .system
  @Published var cornerRadius: CGFloat = 16
  @Published var amount: String = "1000"
  @Published var currencyCodeString: String = "rub"
  @Published var isBordered: Bool = false
  @Published var isSplitAvailable: Bool = true
  @Published var isCardAvailable: Bool = true

  private var paymentURLService: PaymentURLService = PaymentURLService()
  private let navigationController: UINavigationController?
  private var lastPaymentMethodsForPaymentURL: [YPAvailablePaymentMethod] = []
  private var paymentMethodsChanged: Bool {
    preferredPaymentMethods != lastPaymentMethodsForPaymentURL
  }

  var amountNumber: Decimal {
    Decimal(string: amount, locale: Locale.current) ?? .zero
  }

  var currencyCode: YPCurrencyCode {
    YPCurrencyCode(rawValue: currencyCodeString) ?? .rub
  }

  var preferredPaymentMethods: [YPAvailablePaymentMethod] {
    switch (isCardAvailable, isSplitAvailable) {
    case (true, true):
      [.card, .split]
    case (true, false):
      [.card]
    case (false, true):
      [.split]
    case (false, false):
      []
    }
  }

  var buttonModel:  YPButtonModel {
    YPButtonModel(
      amount: amountNumber,
      currency: currencyCode,
      preferredPaymentMethods: preferredPaymentMethods,
      appearance: theme,
      cornerRadius: cornerRadius,
      isLoading: false,
      isBordered: isBordered
    )
  }

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
}

// MARK: - YPButtonPaymentDataProviding

extension PayButtonViewModel: YPButtonPaymentDataProviding {
  func paymentUrl(for yandexPayButton: any YandexPaySDK.YandexPayButtonProtocol) async throws -> String {
    if let paymentUrl = paymentURLService.paymentURL, !paymentMethodsChanged {
      return paymentUrl
    } else if let response = await paymentURLService.requestLink(
      preferredPaymentMethods: preferredPaymentMethods,
      amount: amountNumber
    ) {
      if let paymentURL = response.data?.paymentUrl {
        lastPaymentMethodsForPaymentURL = preferredPaymentMethods
        return paymentURL
      } else {
        makeAlert(with: "Error", message: response.reasonCode)
      }
    } else {
      makeAlert(with: "Error")
    }
    return ""
  }
}

// MARK: - YPButtonPaymentDataProviding

extension PayButtonViewModel: YPButtonPresentationContextProviding {
  func anchorForPresentation(for yandexPayButton: any YandexPaySDK.YandexPayButtonProtocol) -> YandexPaySDK.YPPresentationContext {
    .keyWindow
  }
}

// MARK: - YandexPayButtonDelegate

extension PayButtonViewModel: YandexPayButtonDelegate {
  func yandexPayButton(
    _ button: any YandexPaySDK.YandexPayButtonProtocol,
    didCompletePaymentWithResult result: YandexPaySDK.YPYandexPayPaymentResult,
    data: YandexPaySDK.YPYandexPayPaymentData
  ) {
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

extension PayButtonViewModel {
  func makeAlert(with title: String, message: String? = nil) {
    DispatchQueue.main.async {
      let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
      controller.addAction(UIAlertAction(title: "OK", style: .default))
      self.navigationController?.present(controller, animated: true)
    }
  }
}

extension YPTheme: CaseIterable, Titelable {
  static let allCasesTitles: [String] = YPTheme.allCases.map { $0.rawValue }
  public static let allCases: [YPTheme] = [.system, .light, .dark]
}
