// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "GitHubKit",
    products: [
        .library(name: "GitHubKit", targets: ["GitHubKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0-alpha.1")
    ],
    targets: [
        .target(
            name: "GitHubKit",
            dependencies: [
                "AsyncHTTPClient"
            ]
        )
    ]
)

