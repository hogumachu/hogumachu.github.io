// swift-tools-version: 5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "HogumachuWeb",
  platforms: [.macOS(.v13)],
  dependencies: [
//    .package(path: "../Ignite"), // use local ignite
//    .package(url: "https://github.com/twostraws/Ignite", from: "0.5.1"),
    .package(url: "https://github.com/hogumachu/Ignite", branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "HogumachuWeb",
      dependencies: ["Ignite"]
    ),
  ]
)
