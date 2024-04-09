import UIKit
import YandexPaySDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            // Укажите конфигурацию
            let merchant = YandexPaySDKMerchant(
                id: "ID продавца в системе Yandex Pay",
                name: "Имя продавца",
                url: "URL продавца"
            )
            let configuration = YandexPaySDKConfiguration(
                // Необходимое окружение
                environment: .sandbox,
                // Информация о мерчанте
                merchant: merchant,
                // Локализация
                locale: .ru
            )
            // Инициализируйте SDK
            try YandexPaySDKApi.initialize(configuration: configuration)
        } catch {
            // Отреагируйте на ошибку должным образом
            assertionFailure("Unable to initialize YandexPaySDKApi.")
        }

        // Инициализируйте UIWindow и ViewController
        let controller = PaymentURLViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        YandexPaySDKApi.instance.applicationDidReceiveUserActivity(userActivity)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        YandexPaySDKApi.instance.applicationDidReceiveOpen(url, options: options)
    }
}

