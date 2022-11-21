import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    public static func target(
        name: String,
        product: Product,
        infoPlist: InfoPlist = .default,
        sources: SourceFilesList,
        resources:ResourceFileElements? = nil,
        dependencies: [TargetDependency] = [],
        scripts : [TargetScript] = [],
        baseSettings: ProjectDescription.SettingsDictionary = [:],
        coreDataModels: [CoreDataModel] = []
    ) -> Target {
        return Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: "com.koreamango.\(name.lowercased())",
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: scripts,
            dependencies: dependencies,
            settings: .settings(
                base: [
                    "OTHER_LDFLAGS": "$(inherited)"
                ].merging(baseSettings) { $1 },
                configurations: [],
                defaultSettings: .recommended(excluding: [
                    "TARGETED_DEVICE_FAMILY",
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS",
                ])
            ),
            coreDataModels: coreDataModels
        )
    }
}
