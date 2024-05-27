// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "YandexPaySDK",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "YandexPaySDK", targets: ["YandexPaySDK"]),
  ],
  targets: [
    .binaryTarget(
      name: "YandexPaySDK",
      url: "https://github.com/yandexmobile/yandex-pay-ios/releases/download/v1.7.0/YandexPaySDK.xcframework.zip",
      checksum: "36f7fb91e688a1fd5127707b7d4e4580033cbd063ea07c28f048b055e5591079")
  ]
)
