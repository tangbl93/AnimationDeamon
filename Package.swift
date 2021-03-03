// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "AnimationDeamon",
    platforms: [.iOS(.v9)],
    products: [ .library(name: "AnimationDeamon", targets: ["AnimationDeamon"]) ],
    dependencies: [],
    targets: [
        .target(name: "AnimationDeamon", dependencies: [], path: "AnimationDeamon/Classes")
    ]
)
