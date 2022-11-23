import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin
import Foundation

// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
    name: "MyAppUI",
    organizationName: "com.koreamango",
    options: .options(automaticSchemesOptions: .disabled),
    packages: [],
//    settings: .settings(
//        configurations: [
//            .debug(
//                name: "Dev",
//                settings: [:],
//                xcconfig: "Config/Dev.xcconfig"
//            ),
//        ]
//    ),
    targets: [
        Project.target(
            name: "MyAppUI",
            product: .framework,
            infoPlist: .default,
            sources: "Sources/**")
    ]
//    schemes: []
)
