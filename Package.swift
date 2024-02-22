// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "YandexPaySDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
      .library(name: "YandexPaySDK", targets: ["YandexPaySDK", "XPlatPaySDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "YandexPaySDK",
            url: "https://yandexpay-ios-sdk.s3.yandex.net/1.5.16/YandexPaySDK.xcframework.zip",
            checksum: "4a942614a627ed787f6b1aca490108274098d5a723c088aa024e0e972edb262a"
        ),
        .binaryTarget(
            name: "XPlatPaySDK",
            url: "https://yandexpay-ios-sdk.s3.yandex.net/1.5.16/XPlatPaySDK.xcframework.zip",
            checksum: "820579c54e0ab22c141ec085371db0beec2b2f61ee7660139bd19cabf7fceb9f"
        ),
    ]
)
