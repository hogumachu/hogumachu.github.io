// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "HogumachuWebsite",
  platforms: [.macOS(.v12)],
  products: [
    .executable(
      name: "HogumachuWebsite",
      targets: ["HogumachuWebsite"]
    )
  ],
  dependencies: [
    .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
    .package(name: "SplashPublishPlugin", url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0"),
    .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.11.1")
  ],
  targets: [
    .executableTarget(
      name: "HogumachuWebsite",
      dependencies: [
        "Publish",
        "SplashPublishPlugin",
        .product(name: "TokamakStaticHTML", package: "Tokamak")
      ]
    )
  ]
)
