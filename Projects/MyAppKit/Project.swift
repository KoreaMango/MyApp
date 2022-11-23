import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin
import Foundation

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
    name: "MyAppKit",
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
            name: "MyAppKit",
            product: .framework,
            infoPlist: .default,
            sources: "Sources/**")
    ]
//    schemes: []
)
