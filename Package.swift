// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftCryptoLab",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(name: "SwiftCryptoLab", targets: ["SwiftCryptoLab"])
    ],
    targets: [
        .target(name: "SwiftCryptoLab"),
        .testTarget(name: "SwiftCryptoLabTests", dependencies: ["SwiftCryptoLab"])
    ]
)