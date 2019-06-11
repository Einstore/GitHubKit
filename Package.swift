// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "app",
    products: [
        .library(name: "GithubAPI", targets: ["GithubAPI"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-alpha")
    ],
    targets: [
        .target(
            name: "GithubAPI",
            dependencies: [
                "Vapor"
            ]
        )
    ]
)

