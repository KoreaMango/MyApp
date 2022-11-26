import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin
import Foundation


// MARK: - Project
let tuistDeploy = ProcessInfo.processInfo.environment["TUIST_DEPLOY"]
let isDeploy = (tuistDeploy == "App")

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
    name: "Application",
    organizationName: "com.koreamango",
    options: .options(automaticSchemesOptions: .disabled),
    packages: [
        .remote(url: "https://github.com/FLEXTool/FLEX.git",
                requirement: .upToNextMajor(from: "5.22.10"))
    ],
    targets: [
        isDeploy
        ? Project.target(
            name: "Application",
            product: .app,
            infoPlist: .default,
            sources: "Sources/**",
            resources: "Resources/**",
            dependencies: [
                
            ]
        )
        : Project.target(
            name: "DevApplication",
            product: .app,
            infoPlist: .default,
            sources: ["Sources/**", "DevSources/**"],
            resources: "Resources/**",
            dependencies: [
                .package(product: "FLEX")
            ]
        )
    ]
)

