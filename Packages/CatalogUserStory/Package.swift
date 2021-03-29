// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CatalogUserStory",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CatalogUserStory",
            targets: ["CatalogUserStory"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../UIComponents"),
        .package(path: "../ApiClient")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CatalogUserStory",
            dependencies: ["UIComponents", "ApiClient"],
            resources: [
                .process("./ApiClient/Mocks/200_get_catalog.json")]),
        .testTarget(
            name: "CatalogUserStoryTests",
            dependencies: ["CatalogUserStory"]),
    ]
)