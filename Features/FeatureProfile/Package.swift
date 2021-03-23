// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureProfile",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FeatureProfile",
            targets: ["FeatureProfile"]),
    ],
    dependencies: [
        .package(path: "../../Common/CommonCore"),
        .package(url: "https://github.com/AliSoftware/Dip", from: "7.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FeatureProfile",
            dependencies: ["CommonCore", "Dip"]),
        .testTarget(
            name: "FeatureProfileTests",
            dependencies: ["FeatureProfile"]),
    ]
)
