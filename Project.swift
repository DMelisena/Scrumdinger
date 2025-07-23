import ProjectDescription

let project = Project(
    name: "Scrumdinger",
    targets: [
        .target(
            name: "Scrumdinger",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Scrumdinger",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "ScrumdingerTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.ScrumdingerTests",
            infoPlist: .default,
            sources: ["App/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Scrumdinger")]
        ),
    ]
)
