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

    func requestLink() async -> String? {
        guard let url = URL(string: "https://sandbox.pay.yandex.ru/api/merchant/v1/orders") else {
            assertionFailure("Error: wrong url")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.addValue("Api-Key a5f49c84-0baa-41e1-814f-6f99746a6987", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: PaymentURLService.order)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return nil
            }
            
            let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
            paymentURL = responseData.data.paymentUrl
            return paymentURL
        } catch {
            return nil
        }
    }
}


struct ResponseData: Codable {
    var data: PaymentUrl
}

struct PaymentUrl: Codable {
    var paymentUrl: String
}

private extension PaymentURLService {
    static var order: [String: Any] {
        [
            "orderId": "\(Date().timeIntervalSince1970)",
            "redirectUrls": [
                "onSuccess": "ypay://finish/success.html",
                "onError": "ypay://finish/error.html"
            ],
            "currencyCode": "RUB",
            "availablePaymentMethods": ["CARD", "SPLIT"],
            "cart": [
                "total": [
                    "amount": "1000"
                ],
                "items": [
                    [
                        "total": "1000",
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
