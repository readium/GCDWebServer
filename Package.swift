// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "GCDWebServer",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "ReadiumGCDWebServer", targets: ["ReadiumGCDWebServer"]),
    ],
    targets: [
        .target(
            name: "ReadiumGCDWebServer",
            path: "GCDWebServer",
            cSettings: [
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)
