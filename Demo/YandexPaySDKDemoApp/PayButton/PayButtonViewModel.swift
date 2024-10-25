//
//  PayButtonViewController.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 14.10.2024.
//

import Foundation
import YandexPaySDK

final class PayButtonViewModel: ObservableObject {
    @Published var theme: YPTheme = .system
    @Published var cornerRadius: CGFloat = 16
    @Published var amount: String = "1000"
    @Published var currencyCodeString: String = "rub"
    @Published var isBordered: Bool = false
    @Published var isSplitAvailable: Bool = true
    @Published var isCardAvailable: Bool = true

    private var paymentURLService: PaymentURLService = PaymentURLService()

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
}

// MARK: - YPButtonPaymentDataProviding

extension PayButtonViewModel: YPButtonPaymentDataProviding {
    func paymentUrl(for yandexPayButton: any YandexPaySDK.YandexPayButtonProtocol) async throws -> String {
        if let paymentUrl = paymentURLService.paymentURL {
            return paymentUrl
        } else if let paymentUrl = await paymentURLService.requestLink() {
            return paymentUrl
        } else {
            // обработать ошибку генерации ссылки
            return ""
        }
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

//        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        controller.addAction(UIAlertAction(title: "OK", style: .default))
//        present(controller, animated: true)
    }
}

extension YPTheme: CaseIterable, Titelable {
    static let allCasesTitles: [String] = YPTheme.allCases.map { $0.rawValue }
    public static let allCases: [YPTheme] = [.system, .light, .dark]
}
