// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "weather-api",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "WeatherApi",
            targets: ["WeatherApi"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "WeatherApi",
            dependencies: ["Alamofire"],
            path: "Sources"
        ),
        .testTarget(
            name: "WeatherApiTests",
            dependencies: [
                .target(name: "WeatherApi"),
        ]),
    ]
)
