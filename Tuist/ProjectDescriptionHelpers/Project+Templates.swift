import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
        return Project(name: name,
                       organizationName: "tuist.io",
                       options: .options(automaticSchemesOptions: .disabled),
                       settings: .settings(
                        configurations: [
                            .debug(
                                name: "Dev",
                                settings: [:],
                                xcconfig: "Config/App/Dev.xcconfig"
                                
                            ),
                            .debug(
                                name: "Alpha",
                                settings: [:],
                                xcconfig: "Config/App/Alpha.xcconfig"
                            ),
                            .debug(
                                name: "Prod",
                                settings: [:],
                                xcconfig: "Config/App/Prod.xcconfig"
                            ),
                       ]),
                       targets: targets,
                       schemes: [
                        Scheme(
                            name: "MyApp-Dev",
                            shared: true,
                            buildAction: .buildAction(targets: ["\(name)"]),
                            testAction: .targets(
                                ["\(name)"],
                                configuration: .configuration("Dev"),
                                options: .options(coverage: true)
                            ),
                            runAction: .runAction(configuration: .configuration("Dev")),
                            archiveAction: .archiveAction(configuration: .configuration("Dev")),
                            profileAction: .profileAction(configuration: .configuration("Dev")),
                            analyzeAction: .analyzeAction(configuration: .configuration("Dev"))
                        ),
                        Scheme(
                            name: "MyApp-Alpha",
                            shared: true,
                            buildAction: .buildAction(targets: ["\(name)"]),
                            testAction: .targets(
                                ["\(name)"],
                                configuration: .configuration("Alpha"),
                                options: .options(coverage: true)
                            ),
                            runAction: .runAction(configuration: .configuration("Alpha")),
                            archiveAction: .archiveAction(configuration: .configuration("Alpha")),
                            profileAction: .profileAction(configuration: .configuration("DAlphaev")),
                            analyzeAction: .analyzeAction(configuration: .configuration("Alpha"))
                        ),
                        Scheme(
                            name: "MyApp-Prod",
                            shared: true,
                            buildAction: .buildAction(targets: ["\(name)"]),
                            testAction: .targets(
                                ["\(name)"],
                                configuration: .configuration("Prod"),
                                options: .options(coverage: true)
                            ),
                            runAction: .runAction(configuration: .configuration("Prod")),
                            archiveAction: .archiveAction(configuration: .configuration("Prod")),
                            profileAction: .profileAction(configuration: .configuration("Prod")),
                            analyzeAction: .analyzeAction(configuration: .configuration("Prod"))
                        )
                       ])
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
        let sources = Target(name: name,
                platform: platform,
                product: .framework,
                bundleId: "io.tuist.\(name)",
                infoPlist: .default,
                sources: ["Targets/\(name)/Sources/**"],
                resources: [],
                dependencies: [])
        
        return [sources]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        return [mainTarget]
    }
}
