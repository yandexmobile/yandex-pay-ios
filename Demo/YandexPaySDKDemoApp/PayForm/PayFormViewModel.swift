//
//  PayFormViewModel.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 17.10.2024.
//
import YandexPaySDK
import UIKit

final class PayFormViewModel {
    private var form: YandexPayForm?
    private let navigationController: UINavigationController?

    init(form: YandexPayForm? = nil, navigationController: UINavigationController) {
        self.form = form
        self.navigationController = navigationController
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
        form = YandexPaySDKApi.instance.createYandexPayForm(paymentURL: "https://sandbox.pay.ya.ru/l/gMH34e", delegate: self)

        if let topController = navigationController?.topViewController {
            form?.present(from: topController, animated: true, completion: nil)
        }
    }
}

// MARK: - YandexPayFormDelegate

extension PayFormViewModel: YandexPayFormDelegate {
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

            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default))
            navigationController?.present(controller, animated: true)
        }
}
