// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "YandexPaySDK",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "YandexPaySDK", targets: ["YandexPaySDK", "Varioqub", "VQSwiftProtobuf"]),
  ],
  targets: [
    .binaryTarget(
      name: "YandexPaySDK",
      url: "https://github.com/yandexmobile/yandex-pay-ios/releases/download/v1.8.0/YandexPaySDK.xcframework.zip",
      checksum: "d2f224ea0f6dfb6dce043ca7bfdaa1fb04b5fd8676d34ff85cd1bb7b5f2959ab"
    ),
    .binaryTarget(
      name: "Varioqub",
      url: "https://github.com/yandexmobile/yandex-pay-ios/releases/download/v1.8.0/Varioqub.xcframework.zip",
      checksum: "cef9d1325350d4e643063b247bb3afd82d8f07bf4832f1ac4521344f29bdda61"
    ),
    .binaryTarget(
      name: "VQSwiftProtobuf",
      url: "https://github.com/yandexmobile/yandex-pay-ios/releases/download/v1.8.0/VQSwiftProtobuf.xcframework.zip",
      checksum: "019fe3ebe1c9b0c95afb1f152ae02eb11d9e902790d85e1fbadc4d3c7ab9bdcc"
    )
  ]
)
