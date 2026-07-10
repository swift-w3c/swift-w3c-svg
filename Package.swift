// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-w3c-svg",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "W3C SVG",
            targets: ["W3C SVG"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-format-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-geometry-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-parser-primitives.git", branch: "main"),
        // .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.0")
    ],
    targets: [
        .target(
            name: "W3C SVG",
            dependencies: [
                .product(name: "Format Primitives", package: "swift-format-primitives"),
                .product(name: "Geometry Primitives", package: "swift-geometry-primitives"),
                .product(name: "Parser Primitives", package: "swift-parser-primitives")
            ]
        ),
        .testTarget(
            name: "W3C SVG Tests",
            dependencies: [
                "W3C SVG",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
