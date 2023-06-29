// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnowballSwiftKit",
    platforms: [.iOS(.v15) ],
    products: [
        .library(
            name: "SnowballSwiftKit",
            targets: ["SnowballSwiftKit"]),
        .library(
            name: "SnowballAssetKit",
            targets: ["SnowballAssetKit"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SnowballSwiftKit",
            dependencies: [
                "SnowballAssetKit",
            ]
        ),
        .target(
            name: "SnowballAssetKit",
            resources: [.process("Resources")]
        ),
    ]
)
