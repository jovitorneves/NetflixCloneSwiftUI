// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetflixClone",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "NetflixClone",
            targets: ["NetflixClone"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", 
                 from: "3.0.0")
    ],
    targets: [
        .target(
            name: "NetflixClone",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", 
                         package: "SDWebImageSwiftUI")
            ]
        ),
        .testTarget(
            name: "NetflixCloneTests",
            dependencies: ["NetflixClone"]
        ),
    ]
)
