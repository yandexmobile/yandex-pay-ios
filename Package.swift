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
      url: "https://yandexpay-ios-sdk.s3.yandex.net/1.6.0/YandexPaySDK.xcframework.zip",
      checksum: "5bba75b35dc0abd60daf1d4df85b7d1966f018d64459b69e65f21a3318f6a681")
  ]
)
