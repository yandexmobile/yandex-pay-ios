import UIKit
import YandexPaySDK

final class PaymentURLFormViewController: UIViewController {
    private var form: YandexPayForm?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        // Создайте кнопку
        let button = UIButton(type: .system)
        button.setTitle("Pay", for: .normal)
        button.addTarget(self, action: #selector(openPayForm), for: .touchUpInside)

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

private extension PaymentURLFormViewController {
    @objc
    func openPayForm() {
        // Проверьте, что SDK проинициализирован
        guard YandexPaySDKApi.isInitialized else {
          assertionFailure("YandexPaySDK is not initialized.")
          return
        }
        
        // Скрываем прошлую платежную форму, если она была
        form?.dismiss(animated: false, completion: nil)
        
        // Создайте платежную форму и передайте туда paymentUrl
        form = YandexPaySDKApi.instance.createYandexPayForm(paymentURL: "payment-url.ru", delegate: self)
        
        form?.present(from: self, animated: true, completion: nil)
    }
}

// MARK: - YandexPayFormDelegate

extension PaymentURLFormViewController: YandexPayFormDelegate {
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
            present(controller, animated: true)
        }
}
