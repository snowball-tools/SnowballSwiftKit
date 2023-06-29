// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnowballSwiftKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SnowballSwiftKit",
            targets: ["SnowballSwiftKit"]),
        .library(
            name: "SnowballAssetKit",
            targets: ["SnowballAssetKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke.git", from: "12.1.0"),
    ],
    targets: [
        .target(
            name: "SnowballSwiftKit",
            dependencies: [
                "SnowballAssetKit",
                "Nuke",
                .product(name: "NukeUI", package: "Nuke"),
            ]
        ),
        .target(
            name: "SnowballAssetKit",
            resources: [.process("Resources")]
        ),
    ]
)
