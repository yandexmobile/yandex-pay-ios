import UIKit
import YandexPaySDK

class ViewController: UIViewController {
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
        let button = YandexPaySDKApi.instance.createButton(configuration: configuration, asyncDelegate: self)

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

// MARK: - YandexPayButtonDelegate

extension ViewController: YandexPayButtonAsyncDelegate {
    func yandexPayButton(_ button: YandexPayButton, didCompletePaymentWithResult result: YPPaymentResult) {
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
            title = "Error!"
            message = "An error occured while payment processing."
        }

        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default))
        present(controller, animated: true)
    }

    func yandexPayButtonDidRequestViewControllerForPresentation(_ button: YandexPayButton) -> UIViewController? {
        return self
    }

    func yandexPayButtonDidRequestPaymentSheet(_ button: YandexPayButton, completion: @escaping (YPPaymentSheet?) -> Void) {
        let paymentSheet = YPPaymentSheet(
            countryCode: .ru,
            currencyCode: .rub,
            order: YPOrder(
                id: "ORDER1",
                label: "ORDER1",
                amount: "15000.00",
                items: [
                    YPOrderItem(label: "ITEM1", amount: "10000.00"),
                    YPOrderItem(label: "ITEM2", amount: "5000.00")
                ]
            ),
            paymentMethods: [
                .card(
                    YPCardPaymentMethod(
                        gateway: "yandex-trust",
                        gatewayMerchantId: "MerchantGW1",
                        allowedAuthMethods: [.panOnly, .cloudToken],
                        allowedCardNetworks: [.visa, .mastercard, .mir]
                    )
                )
            ],
            requiredFields: [.billingContactEmail]
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion(paymentSheet)
        }
    }
}
