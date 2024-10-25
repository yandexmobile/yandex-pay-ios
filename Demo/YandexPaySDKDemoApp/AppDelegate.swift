import UIKit
import YandexPaySDK
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            // Укажите конфигурацию
            let merchant = YandexPaySDKMerchant(
                // ID продавца в системе Яндекс Пэй
                id: "a5f49c84-0baa-41e1-814f-6f99746a6987",
                // Имя продавца
                name: "MERCHANT_NAME",
                // URL продавца
                url: "https://example.org/"
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
        let navigationController = UINavigationController()
        let mainControllerViewModel = MainMenuViewModel(navigationController: navigationController)
        let mainController = UIHostingController(
            rootView: MainMenuView(viewModel: mainControllerViewModel)
        )
        navigationController.pushViewController(mainController, animated: false)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // Проверьте, что SDK проинициализирован
        guard YandexPaySDKApi.isInitialized else {
          assertionFailure("YandexPaySDK is not initialized.")
          return false
        }

        return YandexPaySDKApi.instance.applicationDidReceiveUserActivity(userActivity)
    }

//    func application

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Проверьте, что SDK проинициализирован
        guard YandexPaySDKApi.isInitialized else {
          assertionFailure("YandexPaySDK is not initialized.")
          return false
        }

        return YandexPaySDKApi.instance.applicationDidReceiveOpen(url, options: options)
    }
}

