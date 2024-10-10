// swift-tools-version:5.9
import PackageDescription

let yandexPay_Resources_Path = "Frameworks/Static/YandexPaySDKResources.bundle"
let yandexPay_Static_Path = "Frameworks/Static/YandexPaySDK.xcframework"
let yandexPay_Dynamic_Path = "Frameworks/Dynamic/YandexPaySDK.xcframework"
let varioqub_Path = "Frameworks/Varioqub.xcframework"
let vqSwiftProtobuf_Path = "Frameworks/VQSwiftProtobuf.xcframework"

let package = Package(
  name: "YandexPaySDK",
  platforms: [
    .iOS(.v14),
  ],
  products: [
    .library(name: "YandexPaySDK", targets: [
      "YandexPaySDK_Facade",
      "Varioqub",
      "VQSwiftProtobuf"
    ]),
    .library(name: "YandexPaySDK_Dynamic", targets: [
      "YandexPaySDK_Dynamic",
      "Varioqub",
      "VQSwiftProtobuf"
    ])
  ],
  dependencies: [
    .package(
      url: "https://github.com/appmetrica/appmetrica-sdk-ios",
      .upToNextMajor(from: "5.8.1")
    ),
    .package(
      url: "https://github.com/yandexmobile/yandex-login-sdk-ios",
      .upToNextMajor(from: "3.0.2")
    )
  ],
  targets: [
    .binaryTarget(name: "YandexPaySDK_Static", path: "YandexPaySDK/\(yandexPay_Static_Path)"),
    .binaryTarget(name: "YandexPaySDK_Dynamic", path: "YandexPaySDK/\(yandexPay_Dynamic_Path)"),
    .binaryTarget(name: "Varioqub", path: "YandexPaySDK/\(varioqub_Path)"),
    .binaryTarget(name: "VQSwiftProtobuf", path: "YandexPaySDK/\(vqSwiftProtobuf_Path)"),
    .target(
      name: "YandexPaySDK_Facade",
      dependencies: [
        .target(name: "YandexPaySDK_Static"),
        .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
        .product(name: "YandexLoginSDK", package: "yandex-login-sdk-ios"),
      ],
      path: "YandexPaySDK",
      exclude: [
        yandexPay_Static_Path,
        yandexPay_Dynamic_Path,
        varioqub_Path,
        vqSwiftProtobuf_Path
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
