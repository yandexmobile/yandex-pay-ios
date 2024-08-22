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
    .binaryTarget(name: "YandexPaySDK", path: "Frameworks/YandexPaySDK.xcframework"),
    .binaryTarget(name: "Varioqub", path: "Frameworks/Varioqub.xcframework"),
    .binaryTarget(name: "VQSwiftProtobuf", path: "Frameworks/VQSwiftProtobuf.xcframework")
  ]
)
