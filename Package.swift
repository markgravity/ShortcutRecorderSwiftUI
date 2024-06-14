// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShortcutRecorderSwiftUI",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ShortcutRecorderSwiftUI",
            targets: ["ShortcutRecorderSwiftUI"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Kentzo/ShortcutRecorder",
            from: "3.4.0"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ShortcutRecorderSwiftUI",
            dependencies: ["ShortcutRecorder"]
        ),
        .testTarget(
            name: "ShortcutRecorderSwiftUITests",
            dependencies: ["ShortcutRecorderSwiftUI"]
        ),
    ]
)
