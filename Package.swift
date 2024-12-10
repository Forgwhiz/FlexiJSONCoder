// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FlexiJSONCoder",
    platforms: [
        .iOS(.v13),        // Minimum iOS version supported
    ],
    products: [
        .library(
            name: "FlexiJSONCoder",
            type: .dynamic,
            targets: ["FlexiJSONCoder"]
        ),
    ],
    targets: [
        .target(
            name: "FlexiJSONCoder",
            path: "FlexiJSONCoder/Sources"   // Path to your source code
        ),
        .testTarget(
            name: "FlexiJSONCoderTests",
            dependencies: ["FlexiJSONCoder"],
            path: "FlexiJSONCoder/Tests"     // Path to your test files (if applicable)
        ),
    ]
)

