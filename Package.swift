// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporCLI",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Executable", targets: ["Executable"])
    ],
    dependencies: [
        // Swift Promises, Futures, and Streams.
        .package(url: "https://github.com/vapor/async.git", .branch("beta")),
        
        // Swift wrapper for Console I/O.
        .package(url: "https://github.com/vapor/console.git", .branch("beta")),
        
        // Core extensions, type-aliases, and functions that facilitate common tasks.
        .package(url: "https://github.com/vapor/core.git", .branch("beta")),
        
        // Cryptography modules
        .package(url: "https://github.com/vapor/crypto.git", .branch("beta")),
        
        // Non-blocking networking for Swift (HTTP and WebSockets).
        .package(url: "https://github.com/vapor/engine.git", .branch("beta")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Console", "Command"],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Executable", dependencies: ["Console", "App"]),
    ]
)
