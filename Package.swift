// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-w3c-svg",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "W3C SVG",
            targets: ["W3C SVG"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-segment.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-formatter.git",
            branch: "main", traits: ["Number", "Conversions", "Tagged"]),
        .package(
            url: "https://github.com/swift-atoms/swift-geometry.git",
            branch: "main", traits: ["Affine"]),
        .package(
            url: "https://github.com/swift-atoms/swift-parser.git",
            branch: "main",
            traits: ["Collection"]
        ),
        .package(url: "https://github.com/swift-atoms/swift-linear.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "W3C SVG",
            dependencies: [
                .product(name: "Segment", package: "swift-segment"),
                .product(name: "Formatter", package: "swift-formatter"),
                .product(name: "Geometry", package: "swift-geometry"),
                .product(name: "Parser", package: "swift-parser"),
                .product(name: "Linear", package: "swift-linear"),
            ]
        ),
        .testTarget(
            name: "W3C SVG Tests",
            dependencies: [
                "W3C SVG"
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
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
