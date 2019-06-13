// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "app",
    products: [
        .library(name: "GitHubKit", targets: ["GitHubKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/swift-nio-http-client.git", .exact("0.0.0"))
    ],
    targets: [
        .target(
            name: "GitHubKit",
            dependencies: [
                "NIOHTTPClient"
            ]
        )
    ]
)

