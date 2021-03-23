// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServiceSportmaster",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ServiceSportmaster",
            targets: ["ServiceSportmaster"]),
    ],
    dependencies: [
        .package(path: "../../Features/FeatureSportmasterMain"),
        .package(path: "../../Features/FeatureProfile"),
        .package(url: "https://github.com/AliSoftware/Dip", from: "7.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ServiceSportmaster",
            dependencies: ["FeatureSportmasterMain", "FeatureProfile", "Dip"]),
        .testTarget(
            name: "ServiceSportmasterTests",
            dependencies: ["ServiceSportmaster"]),
    ]
)
