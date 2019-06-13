// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "app",
    products: [
        .library(name: "GithubConnector", targets: ["GithubConnector"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-alpha.1.2")
    ],
    targets: [
        .target(
            name: "GithubConnector",
            dependencies: [
                "Vapor"
            ]
        )
    ]
)

