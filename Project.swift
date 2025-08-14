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
            dependencies: [
                .external(name: "HotSwiftUI"),
                .external(name: "GoogleGenerativeAI"),
                // .external(name: "Inject"),
            ],
            settings: .settings(
                base: [
                    "OTHER_LDFLAGS": [
                        "$(inherited)", // Always include this to preserve default linker flags
                        "-Xlinker", // Passes the next argument directly to the linker
                        "-interposable", // The actual linker flag
                        // You can add more flags here, each as a separate string element
                        // "-Xlinker", "-some_other_linker_flag",
                        // "-framework", "MyCustomFramework" // Example for linking a framework
                    ],
                    // User defined build setting
                    "EMIT_FRONTEND_COMMAND_LINES": "YES",
                ]
            )
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
