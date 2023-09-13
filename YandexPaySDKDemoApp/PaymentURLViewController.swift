import UIKit
import YandexPaySDK

final class PaymentURLViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        // Проверьте, что SDK проинициализирован
        guard YandexPaySDKApi.isInitialized else {
          assertionFailure("YandexPaySDK is not initialized.")
          return
        }

        // Укажите тему для кнопки
        let theme: YandexPayButtonTheme
        if #available(iOS 13.0, *) {
            // Параметр `dynamic` позволяет указать, нужно ли кнопке
            // менять свою цветовую палитру вместе со сменой системной темы
            theme = YandexPayButtonTheme(appearance: .dark, dynamic: true)
        } else {
            theme = YandexPayButtonTheme(appearance: .dark)
        }

        // Инициализируйте конфигурацию
        let configuration = YandexPayButtonConfiguration(theme: theme)

        // Создайте кнопку
        let button = YandexPaySDKApi.instance.createButton(configuration: configuration, dataSource: self, delegate: self)

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

// MARK: - YandexPayButtonDataSource

extension PaymentURLViewController: YandexPayButtonDataSource {
  func paymentUrl(for yandexPayButton: YandexPayButton) async throws -> String {
    // Запросите paymentUrl (создайте заказ) асинхронно с вашего бекенда
    await withCheckedContinuation { continuation in
      // Это пример реализации async кода, скорее всего здесь будет сетевой запрос
      DispatchQueue.main.async {
        continuation.resume(returning: "payment-url.ru")
      }
    }
  }
  
  func requiredFields(for yandexPayButton: YandexPayButton) async -> Set<YPRequiredField> {
    // Набор обязательных полей, которые должен предоставить клиент
    [.billingContactEmail]
  }
  
  func billingContact(for yandexPayButton: YandexPaySDK.YandexPayButton) async -> YPBillingContact? {
    // Email клиента для заказа, можно вернуть либо сразу значение, либо асинхронно, либо nil
    YPBillingContact(email: "example@yandex.ru")
  }
  
  func viewControllerForPresentation(for yandexPayButton: YandexPayButton) -> UIViewController {
    // Предоставьте UIViewController, с которого необходимо показать форму YandexPay по нажатию на кнопку
    self
  }
}

// MARK: - YandexPayButtonDelegate

extension PaymentURLViewController: YandexPayButtonDelegate {
    func yandexPayButton(_ button: YandexPayButton, didCompletePaymentWithResult result: YPYandexPayPaymentResult) {
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
