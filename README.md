# Yandex Pay SDK

## Documentation

- [Миграция с Yandex Pay SDK 1.x](https://pay.yandex.ru/docs/ru/custom/ios-sdk/migration-to-yandex-pay-kit)
- [Пример интеграции](https://github.com/yandexmobile/yandex-pay-modular-sdk-ios-samples)

## Требования

- iOS 15.0+
- Swift 5.9+
- Xcode 16.4+

## Содержание

1. [Установка](#установка)
2. [Настройка проекта](#настройка-проекта)
   - [Client ID](#1-client-id)
   - [URL-схемы](#2-url-схемы)
   - [Инициализация](#3-инициализация)
   - [Контекст представления](#4-контекст-представления)
   - [Обработка диплинков](#5-обработка-диплинков)

---

## Установка

### Swift Package Manager

В файле `Package.swift` добавьте зависимость от репозитория:

```swift
dependencies: [
    .package(
        url: "https://github.com/yandexmobile/yandex-pay-ios.git",
        from: "2.1.1"
    )
]
```

Затем добавьте нужные продукты к цели:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "YandexPayAuth",      package: "yandex-pay-ios"),
        .product(name: "YandexQuickPay",     package: "yandex-pay-ios"),
        .product(name: "YandexPayAssistant", package: "yandex-pay-ios"),
        // и другие необходимые
    ]
)
```

Либо добавьте зависимость через Xcode: **File → Add Package Dependencies…**, вставьте URL репозитория и выберите нужные продукты в диалоге.

Доступные продукты:

| Продукт | Назначение |
|---|---|
| `YandexPayAuth` | Авторизация через Яндекс ID |
| `YandexQuickPay` | CP QR |
| `YandexPayAssistant` | Сервис выгодной покупки |
| `YandexPayInventory` | Инвентарь |
| `YandexPayInApp` | Встроенные оплаты (InApps) |
| `YandexPayWithRedirect` | Кнопка и форма оплаты по ссылке	|

### CocoaPods

Добавьте только нужные пакеты

```ruby
pod 'YandexPaySDK/YandexPayAuth'      # при необходимости
pod 'YandexPaySDK/YandexQuickPay'     # при необходимости
pod 'YandexPaySDK/YandexPayAssistant' # при необходимости
```

---

## Настройка проекта

### 1. Client ID

SDK использует до двух идентификаторов клиента:

| Ключ | Обязательный | Описание |
|---|---|---|
| `YANDEX_PAY_CLIENT_ID` | Да | Выдаётся командой Yandex Pay |
| `YANDEX_CLIENT_ID` | Да | Используется SDK для настройки авторизации через Yandex ID. Если в вашем приложении уже есть OAuth Client ID для Yandex ID, укажите его. Если приложение не подключает Yandex ID отдельно, укажите то же значение, что и в YANDEX_PAY_CLIENT_ID. |

**Шаг 1.** Откройте настройки цели в Xcode: вкладка **Build Settings → All → User-Defined**. Добавьте одну или обе переменные:

```
YANDEX_PAY_CLIENT_ID = <ваш идентификатор>
YANDEX_CLIENT_ID     = <ваш идентификатор>
```

**Шаг 2.** Добавьте ссылки на эти переменные в `Info.plist`:

```xml
<key>YANDEX_PAY_CLIENT_ID</key>
<string>$(YANDEX_PAY_CLIENT_ID)</string>

<key>YANDEX_CLIENT_ID</key>
<string>$(YANDEX_CLIENT_ID)</string>
```

### 2. URL-схемы

Для каждого используемого client ID необходимо зарегистрировать URL-схему, чтобы SDK мог получать OAuth-колбэки.

Схема формируется по правилу: `yx` + значение client ID.  
Например, для client ID `abcdef1234567890` схема будет `yxabcdef1234567890`.

Добавьте в `Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YandexLoginSDK</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Схема для YANDEX_PAY_CLIENT_ID -->
            <string>yx$(YANDEX_PAY_CLIENT_ID)</string>
            <!-- Схема для YANDEX_CLIENT_ID -->
            <string>yx$(YANDEX_CLIENT_ID)</string>
        </array>
    </dict>
</array>
```

### 3. Инициализация

Вызовите `YPay.initialize(...)` один раз при старте приложения — в `SceneDelegate` или `AppDelegate`, до первого обращения к любому модулю.

```swift
import YandexPayConfiguration
import YandexPayAuth
import YandexQuickPay
import YandexPayAssistant
import YandexPayWithRedirect
import YandexPayInApp
import YandexPayInventory

let merchant = YPSDKMerchant(
    id: "ваш-merchant-id",
    name: "Название магазина",
    url: nil
)

YPay.initialize(
    environment: .production,
    locale: .ru,
    modules: [
        // Только необходимые модули здесь нужно указать
        YPayWithRedirect.module(merchant: merchant),
        YPayInApp.module(merchant: merchant),
        YPAssistantModule.module(merchant: merchant),
        YPayInventory.module(merchant: merchant),
        YPayAuth.module(),
        YQuickPay.module(
          stateListener: stateListener,
          merchant: merchant,
          presentationContextProvider: presentationContextProvider
        )
    ]
)
```

После успешной инициализации доступ к конфигурации и модулям осуществляется через синглтон `YPay.instance`.

**Параметры `YPay.initialize`:**

| Параметр | Тип | Значение по умолчанию | Описание |
|---|---|---|---|
| `environment` | `YPSDKEnvironment` | — | `.production` или `.sandbox` |
| `locale` | `YPSDKLocale` | — | `.ru`, `.en` или `.system` |
| `theme` | `YPSDKThemeColorScheme` | `.system` | Цветовая схема: `.light`, `.dark`, `.system` |
| `enableLogging` | `Bool` | `false` | Включить отладочные логи |
| `modules` | `[YandexPaySDKModule]` | — | Список подключаемых модулей |

### 4. Контекст представления

SDK необходимо знать, поверх какого экрана показывать свои UI-потоки. Для этого реализуйте протокол `YPPresentationContextProviding` и передайте его в `presentationContextProvider` при инициализации.

```swift
import YandexPayConfiguration

extension MySceneDelegate: YPPresentationContextProviding {
    func anchorForPresentation() -> YPPresentationContext {
        // Варианты:
        .viewController(rootViewController)   // конкретный UIViewController
        // .window(myWindow)                  // конкретный UIWindow
        // .keyWindow                         // ключевое окно приложения
    }
}
```

### 5. Обработка диплинков

Передавайте входящие URL и user activity в SDK из `SceneDelegate`. Метод `deeplinkHandler` автоматически маршрутизирует их к нужному модулю.

```swift
import YandexPayConfiguration

// Обработка кастомных URL-схем (OAuth-колбэки)
func scene(_ scene: UIScene, openURLContexts contexts: Set<UIOpenURLContext>) {
    guard YPay.isInitialized else { return }
    contexts.map(\.url).forEach { url in
        YPay.instance.deeplinkHandler.handleOpenURL(url)
    }
}

// Обработка Universal Links
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    guard YPay.isInitialized else { return }
    YPay.instance.deeplinkHandler.handleUserActivity(userActivity)
}
```

> Всегда проверяйте `YPay.isInitialized` перед обращением к `YPay.instance`, так как `SceneDelegate` может получить URL до момента инициализации SDK.

---
