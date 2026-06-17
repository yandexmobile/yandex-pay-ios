// swift-tools-version: 5.9
// Auto-generated

import PackageDescription

let package = Package(
  name: "YandexPaySDK",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "YandexPayConfiguration", targets: ["YandexPayConfigurationWrapper"]),
    .library(name: "YandexPayAuth", targets: ["YandexPayAuthWrapper"]),
    .library(name: "YandexPayWithRedirect", targets: ["YandexPayWithRedirectWrapper"]),
    .library(name: "YandexPayInApp", targets: ["YandexPayInAppWrapper"]),
    .library(name: "YandexPayAssistant", targets: ["YandexPayAssistantWrapper"]),
    .library(name: "YandexPayInventory", targets: ["YandexPayInventoryWrapper"]),
    .library(name: "YandexQuickPay", targets: ["YandexQuickPayWrapper"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/appmetrica/appmetrica-sdk-ios",
      .upToNextMajor(from: "5.15.0")
    ),
  ],
  targets: [
    .target(
      name: "YandexPayConfigurationWrapper",
      dependencies: [
        "YandexPayConfiguration",
        "FintechSDKLoginAdapter",
        "FintechSDKAuthInterfaces",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKCommonEntity",
        "FintechSDKPayBoxEntity",
        "FintechSDKCoreUI",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUtils",
        "FintechSDKNetworkInterfaces",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexPayConfigurationWrapper"
    ),
    .target(
      name: "YandexPayAuthWrapper",
      dependencies: [
        "YandexPayAuth",
        "YandexPayConfiguration",
        "FintechSDKLoginAdapter",
        "FintechSDKAuthInterfaces",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKCoreUtils",
        "FintechSDKCommonEntity",
        "FintechSDKPayBoxEntity",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUI",
        "FintechSDKNetworkInterfaces",
        "FintechSDKYandexPayAuth",
        "FintechSDKExternalAuthWebView",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKLoaderScreen",
        "FintechSDKNativeErrorFeature",
        "FintechSDKNetworkImplementation",
        "FintechSDKPayBoxResources",
        "FintechSDKWebViewFeatures",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexPayAuthWrapper"
    ),
    .target(
      name: "YandexPayWithRedirectWrapper",
      dependencies: [
        "YandexPayWithRedirect",
        "FintechSDKMerchantRedirect",
        "FintechSDKPollingScenario",
        "FintechSDKPayBoxEntity",
        "FintechSDKPayBoxResources",
        "FintechSDKPayOrderData",
        "FintechSDKPayMerchantData",
        "FintechSDKRedirectScenario",
        "FintechSDKPayFormFeatures",
        "FintechSDKPayButton",
        "FintechSDKPayBadge",
        "FintechSDKPayWidget",
        "FintechSDKUltimateWidget",
        "FintechSDKCoreUI",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKFontsInterfaces",
        "FintechSDKBDUICore",
        "FintechSDKBDUIFeatures",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKCommonEntity",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAuthInterfaces",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKNativeErrorFeature",
        "FintechSDKRemoteResourcesData",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKWebViewFeatures",
        "FintechSDKExternalAuthWebView",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKLoaderScreen",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "ExternalBduiAdapter",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        "FintechSDKLoginAdapter",
        "YandexPayConfiguration",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexPayWithRedirectWrapper"
    ),
    .target(
      name: "YandexPayInAppWrapper",
      dependencies: [
        "YandexPayInApp",
        "FintechSDKMerchantRedirect",
        "FintechSDKPollingScenario",
        "FintechSDKPayBoxEntity",
        "FintechSDKPayBoxResources",
        "FintechSDKPayOrderData",
        "FintechSDKPayMerchantData",
        "FintechSDKRedirectScenario",
        "FintechSDKPayFormFeatures",
        "FintechSDKPayButton",
        "FintechSDKPayBadge",
        "FintechSDKPayWidget",
        "FintechSDKUltimateWidget",
        "FintechSDKCoreUI",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKFontsInterfaces",
        "FintechSDKBDUICore",
        "FintechSDKBDUIFeatures",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKCommonEntity",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAuthInterfaces",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKNativeErrorFeature",
        "FintechSDKRemoteResourcesData",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKWebViewFeatures",
        "FintechSDKExternalAuthWebView",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKLoaderScreen",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "ExternalBduiAdapter",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        "FintechSDKLoginAdapter",
        "YandexPayConfiguration",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexPayInAppWrapper"
    ),
    .target(
      name: "YandexPayAssistantWrapper",
      dependencies: [
        "YandexPayAssistant",
        "FintechSDKAssistant",
        "FintechSDKAuthInterfaces",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKLoaderScreen",
        "FintechSDKBDUIFeatures",
        "FintechSDKBDUICore",
        "FintechSDKCommonEntity",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUI",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAnalyticsInterfaces",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKWebViewFeatures",
        "FintechSDKExternalAuthWebView",
        "FintechSDKRemoteResourcesData",
        "FintechSDKNativeErrorFeature",
        "FintechSDKPayBoxResources",
        "FintechSDKPayBoxEntity",
        "ExternalBduiAdapter",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "FintechSDKLoginAdapter",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        "YandexPayConfiguration",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexPayAssistantWrapper"
    ),
    .target(
      name: "YandexPayInventoryWrapper",
      dependencies: [
        "YandexPayInventory",
        "FintechSDKMerchantRedirect",
        "FintechSDKPollingScenario",
        "FintechSDKPayBoxEntity",
        "FintechSDKPayBoxResources",
        "FintechSDKPayOrderData",
        "FintechSDKPayMerchantData",
        "FintechSDKRedirectScenario",
        "FintechSDKPayFormFeatures",
        "FintechSDKPayButton",
        "FintechSDKPayBadge",
        "FintechSDKPayWidget",
        "FintechSDKUltimateWidget",
        "FintechSDKCoreUI",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKFontsInterfaces",
        "FintechSDKBDUICore",
        "FintechSDKBDUIFeatures",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKCommonEntity",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAuthInterfaces",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKNativeErrorFeature",
        "FintechSDKRemoteResourcesData",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKWebViewFeatures",
        "FintechSDKExternalAuthWebView",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKLoaderScreen",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "ExternalBduiAdapter",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        "FintechSDKLoginAdapter",
        "YandexPayConfiguration",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexPayInventoryWrapper"
    ),
    .target(
      name: "YandexQuickPayWrapper",
      dependencies: [
        "YandexQuickPay",
        "FintechSDKQuickPayment",
        "FintechSDKQuickPaymentEntity",
        "FintechSDKQuickPaymentShared",
        "FintechSDKPollingScenario",
        "FintechSDKAuthInterfaces",
        "FintechSDKBDUIFeatures",
        "FintechSDKBDUICore",
        "FintechSDKCommonEntity",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUI",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAnalyticsInterfaces",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKExternalAuthWebView",
        "FintechSDKRemoteResourcesData",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKNativeErrorFeature",
        "FintechSDKLoaderScreen",
        "FintechSDKNavigationInterfaces",
        "FintechSDKNavigationImplementation",
        "FintechSDKPayBoxEntity",
        "FintechSDKPayBoxResources",
        "FintechSDKWebViewFeatures",
        "ExternalBduiAdapter",
        "FintechBDUIWrapper",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "FintechSDKLoginAdapter",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        "YandexPayConfiguration",
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "Sources/YandexQuickPayWrapper"
    ),
    .binaryTarget(
      name: "FintechSDKLoginAdapter",
      path: "XCFrameworks/FintechSDKLoginAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAuthInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAppMetricaAdapter",
      path: "XCFrameworks/FintechSDKAppMetricaAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAnalyticsInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKFontsAdapter",
      path: "XCFrameworks/FintechSDKFontsAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKFontsInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRealTimeAnalyticsAdapter",
      path: "XCFrameworks/FintechSDKRealTimeAnalyticsAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRealUserMonitoringAdapter",
      path: "XCFrameworks/FintechSDKRealUserMonitoringAdapter.xcframework"
    ),
    .binaryTarget(
      name: "ExternalBduiAdapter",
      path: "XCFrameworks/ExternalBduiAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechBDUIWrapper",
      path: "XCFrameworks/FintechBDUIWrapper.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKBDUICore",
      path: "XCFrameworks/FintechSDK/FintechSDKBDUICore.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKBDUIFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKBDUIFeatures.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNetworkInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCoreUtils",
      path: "XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework"
    ),
    .binaryTarget(
      name: "FintechPlusSDKInterfaces",
      path: "XCFrameworks/FintechSDK/FintechPlusSDKInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCoreAnalytics",
      path: "XCFrameworks/FintechSDK/FintechSDKCoreAnalytics.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCoreUI",
      path: "XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCommonEntity",
      path: "XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNetworkImplementation",
      path: "XCFrameworks/FintechSDK/FintechSDKNetworkImplementation.xcframework"
    ),
    .binaryTarget(
      name: "FintechYBSDKInterfaces",
      path: "XCFrameworks/FintechSDK/FintechYBSDKInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRemoteResourcesData",
      path: "XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayConfiguration",
      path: "XCFrameworks/YandexPayConfiguration.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayBoxEntity",
      path: "XCFrameworks/FintechSDK/FintechSDKPayBoxEntity.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayAuth",
      path: "XCFrameworks/YandexPayAuth.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKYandexPayAuth",
      path: "XCFrameworks/FintechSDK/FintechSDKYandexPayAuth.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKExternalAuthWebView",
      path: "XCFrameworks/FintechSDK/FintechSDKExternalAuthWebView.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAuthCoreImplementation",
      path: "XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAuthorizationScenario",
      path: "XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKLoaderScreen",
      path: "XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNativeErrorFeature",
      path: "XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayBoxResources",
      path: "XCFrameworks/FintechSDK/FintechSDKPayBoxResources.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKWebViewFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayWithRedirect",
      path: "XCFrameworks/YandexPayWithRedirect.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKMerchantRedirect",
      path: "XCFrameworks/FintechSDK/FintechSDKMerchantRedirect.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPollingScenario",
      path: "XCFrameworks/FintechSDK/FintechSDKPollingScenario.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayOrderData",
      path: "XCFrameworks/FintechSDK/FintechSDKPayOrderData.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayMerchantData",
      path: "XCFrameworks/FintechSDK/FintechSDKPayMerchantData.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRedirectScenario",
      path: "XCFrameworks/FintechSDK/FintechSDKRedirectScenario.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayFormFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKPayFormFeatures.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayButton",
      path: "XCFrameworks/FintechSDK/FintechSDKPayButton.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayBadge",
      path: "XCFrameworks/FintechSDK/FintechSDKPayBadge.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayWidget",
      path: "XCFrameworks/FintechSDK/FintechSDKPayWidget.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKUltimateWidget",
      path: "XCFrameworks/FintechSDK/FintechSDKUltimateWidget.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKDivKitWidgetsFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayInApp",
      path: "XCFrameworks/YandexPayInApp.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayAssistant",
      path: "XCFrameworks/YandexPayAssistant.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAssistant",
      path: "XCFrameworks/FintechSDK/FintechSDKAssistant.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayInventory",
      path: "XCFrameworks/YandexPayInventory.xcframework"
    ),
    .binaryTarget(
      name: "YandexQuickPay",
      path: "XCFrameworks/YandexQuickPay.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKQuickPayment",
      path: "XCFrameworks/FintechSDK/FintechSDKQuickPayment.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKQuickPaymentEntity",
      path: "XCFrameworks/FintechSDK/FintechSDKQuickPaymentEntity.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKQuickPaymentShared",
      path: "XCFrameworks/FintechSDK/FintechSDKQuickPaymentShared.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNavigationInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKNavigationInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNavigationImplementation",
      path: "XCFrameworks/FintechSDK/FintechSDKNavigationImplementation.xcframework"
    ),
  ]
)
