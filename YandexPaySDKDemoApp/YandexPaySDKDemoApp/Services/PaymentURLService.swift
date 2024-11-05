//
//  PaymentLinkService.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 22.10.2024.
//

import YandexPaySDK
import Foundation
import SwiftUI

final class PaymentURLService {
  var paymentURL: String?

  func requestLink(
    preferredPaymentMethods: [YPAvailablePaymentMethod],
    cartItems: [Product],
    amount: Decimal
  ) async -> ResponseData? {
    guard let url = URL(string: "https://sandbox.pay.yandex.ru/api/merchant/v1/orders") else {
      return nil
    }

    var request = URLRequest(url: url)
    request.addValue("Api-Key a5f49c84-0baa-41e1-814f-6f99746a6987", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = try? JSONSerialization.data(withJSONObject: PaymentURLService.order(
      preferredPaymentMethods: preferredPaymentMethods,
      cartItems: cartItems,
      amount: amount
    ))

    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
      paymentURL = responseData.data?.paymentUrl
      return responseData
    } catch {
      return nil
    }
  }
}


struct ResponseData: Codable {
  let data: PaymentUrl?
  let reasonCode: String?
}

struct PaymentUrl: Codable {
  let paymentUrl: String
}

extension PaymentURLService {
  private static func order(
    preferredPaymentMethods: [YPAvailablePaymentMethod],
    cartItems: [Product],
    amount: Decimal
  ) -> [String: Any] {
    [
      "orderId": "\(Date().timeIntervalSince1970)",
      "redirectUrls": [
        "onSuccess": "ypay://finish/success.html",
        "onError": "ypay://finish/error.html"
      ],
      "currencyCode": "RUB",
      "availablePaymentMethods": preferredPaymentMethods.map { $0.rawValue },
      "cart": [
        "total": [
          "amount": "\(amount)"
        ],
        "items":
          cartItems.map { $0.toAny }
      ] as [String: Any]
    ]
  }

  static func defaultCartItems(amount: Decimal) -> [Product] {
    [Product(
      title: "Продукт",
      description: "",
      amount: amount/2,
      image: Image(systemName: "bag")
    ),
     Product(
       title: "Продукт",
       description: "",
       amount: amount/2,
       image: Image(systemName: "bag")
     )
    ]
  }
}
