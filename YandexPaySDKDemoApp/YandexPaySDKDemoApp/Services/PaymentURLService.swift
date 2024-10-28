//
//  PaymentLinkService.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 22.10.2024.
//

import YandexPaySDK
import Foundation

final class PaymentURLService {
  var paymentURL: String?

  func requestLink(
    preferredPaymentMethods: [YPAvailablePaymentMethod],
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

private extension PaymentURLService {
  static func order(
    preferredPaymentMethods: [YPAvailablePaymentMethod],
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
        "items": [
          [
            "total": "\(amount)",
            "productId": "id",
            "quantity": [
              "count": "1"
            ]
          ] as [String: Any]
        ]
      ] as [String: Any]
    ]
  }
}
