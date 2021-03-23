// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServiceSportmaster",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ServiceSportmaster",
            targets: ["ServiceSportmaster"]),
    ],
    dependencies: [
        .package(path: "../../Features/FeatureSportmasterMain"),
        .package(path: "../../Features/FeatureProfile"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ServiceSportmaster",
            dependencies: ["FeatureSportmasterMain", "FeatureProfile"]),
        .testTarget(
            name: "ServiceSportmasterTests",
            dependencies: ["ServiceSportmaster"]),
    ]
)

/*
let package = Package(
    name: "AuthUserStory",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AuthUserStory",
            targets: ["AuthUserStory"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../UIComponents"),
        .package(path: "../CommonAssets"),
        .package(path: "../ApiClient")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AuthUserStory",
            dependencies: ["UIComponents", "CommonAssets", "ApiClient"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "AuthUserStoryTests",
            dependencies: ["AuthUserStory"]),
    ]
)
*/