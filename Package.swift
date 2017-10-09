// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporCLI",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Executable", targets: ["Executable"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/console.git", .upToNextMajor(from: "2.2.0")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Console"],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Executable", dependencies: ["App"]),
    ]
)
