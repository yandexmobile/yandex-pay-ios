// swift-tools-version:5.9
import PackageDescription

let yandexPay_Resources_Path = "Frameworks/Static/YandexPaySDKResources.bundle"
let yandexPay_Static_Path = "Frameworks/Static/YandexPaySDK.xcframework"
let yandexPay_Dynamic_Path = "Frameworks/Dynamic/YandexPaySDK.xcframework"

let package = Package(
  name: "YandexPaySDK",
  platforms: [
    .iOS(.v14),
  ],
  products: [
    .library(name: "YandexPaySDK", targets: [
      "YandexPaySDK_Facade",
    ]),
    .library(name: "YandexPaySDK_Dynamic", targets: [
      "YandexPaySDK_Dynamic",
    ])
  ],
  dependencies: [
    .package(
      url: "https://github.com/appmetrica/appmetrica-sdk-ios",
      .upToNextMajor(from: "5.8.1")
    )
  ],
  targets: [
    .binaryTarget(name: "YandexPaySDK_Static", path: "YandexPaySDK/\(yandexPay_Static_Path)"),
    .binaryTarget(name: "YandexPaySDK_Dynamic", path: "YandexPaySDK/\(yandexPay_Dynamic_Path)"),
    .target(
      name: "YandexPaySDK_Facade",
      dependencies: [
        .target(name: "YandexPaySDK_Static"),
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
      ],
      path: "YandexPaySDK",
      exclude: [
        yandexPay_Static_Path,
        yandexPay_Dynamic_Path,
      ],
      sources: [
        "Dummy.swift"
      ],
      resources: [
        .copy(yandexPay_Resources_Path)
      ]
    )
  ]
)
