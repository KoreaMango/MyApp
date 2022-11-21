import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin
import Foundation


// MARK: - Project
let tuistDependencies =  ProcessInfo.processInfo.environment["TUIST_EXCEPT_FRAMEWORK"]
let isExceptDepen = (tuistDependencies == "Y")

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
    name: "App",
    organizationName: "com.koreamango",
    options: .options(automaticSchemesOptions: .disabled),
    packages: [],
//    settings: .settings(
//        configurations: [
//            .debug(
//                name: "Dev",
//                settings: [:],
//                xcconfig: "Config/Dev.xcconfig"
//            )
//        ]
//    ),
    targets: [
        Project.target(
            name: "App",
            product: .app,
            infoPlist: .default,
            sources: "Sources/**",
            resources: "Resources/**",
            dependencies: [
                .project(target: "AppKit", path: .relativeToRoot("Projects/TuistMyAppKit")),
                .project(target: "AppUI", path: .relativeToRoot("Projects/TuistMyAppUI"))
            ]
        )
    ]
//    schemes: []
)
