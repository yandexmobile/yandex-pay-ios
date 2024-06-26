import UIKit
import YandexPaySDK

final class PaymentURLViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        // Проверьте, что SDK проинициализирован
        guard YandexPaySDKApi.isInitialized else {
          assertionFailure("YandexPaySDK is not initialized.")
          return
        }

        // Есть возможность настроить отображение кнопки
        let buttonModel = YPButtonModel(
            amount: 1000,
            currency: .rub,
            preferredPaymentMethods: [.card, .split],
            appearance: .system,
            cornerRadius: 16,
            isLoading: false,
            isBordered: false
        )

        // Создайте кнопку
        let button: UIView = YandexPaySDKApi.instance.createButton(
            model: buttonModel,
            paymentDataProvider: self,
            presentationContextProvider: self,
            delegate: self
        )

        // Добавьте кнопку в иерархию
        view.addSubview(button)

        // Установите layout для кнопки
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}

// MARK: - YPButtonPaymentDataProviding

extension PaymentURLViewController: YPButtonPaymentDataProviding {
  func paymentUrl(for yandexPayButton: YandexPayButtonProtocol) async throws -> String {
    // Запросите paymentUrl (создайте заказ) асинхронно с вашего бекенда
    await withCheckedContinuation { continuation in
      // Это пример реализации async кода, скорее всего здесь будет сетевой запрос
      DispatchQueue.main.async {
        continuation.resume(returning: "payment-url.ru")
      }
    }
  }
}

// MARK: - YPButtonPaymentDataProviding

extension PaymentURLViewController: YPButtonPresentationContextProviding {
    func anchorForPresentation(for yandexPayButton: any YandexPayButtonProtocol) -> YPPresentationContext {
        .viewController(self)
    }
}

// MARK: - YandexPayButtonDelegate

extension PaymentURLViewController: YandexPayButtonDelegate {
    func yandexPayButton(
        _ button: YandexPayButtonProtocol,
        didCompletePaymentWithResult result: YPYandexPayPaymentResult,
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

        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default))
        present(controller, animated: true)
    }
}
