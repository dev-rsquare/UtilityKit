// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
//    platforms: [.iOS(.v9), .macOS(.v10_10), .tvOS(.v9), .watchOS(.v2)],

import PackageDescription

let package = Package(
    name: "UtilityKit",
    platforms: [.iOS(.v11), .macOS(.v10_13), .tvOS(.v11), .watchOS(.v4)],
    products: [
        .library(
            name: "UtilityKit",
            targets: ["UtilityKit"]),
    ],
    targets: [
        .target(
            name: "UtilityKit",
            dependencies: []),
        .testTarget(
            name: "UtilityKitTests",
            dependencies: ["UtilityKit"]),
    ],
    swiftLanguageVersions: [.v5 ]
)
//    platforms: [.iOS(.v9), .macOS(.v10_10), .tvOS(.v9), .watchOS(.v2)],
