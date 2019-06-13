// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "app",
    products: [
        .library(name: "GitHubKit", targets: ["GitHubKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/swift-nio-http-client.git", .branch("master"))
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

