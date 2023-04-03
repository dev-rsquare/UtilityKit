// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UtilityKit",
    platforms: [.iOS(.v13), .macOS(.v13), .tvOS(.v13), .watchOS(.v6)],
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
