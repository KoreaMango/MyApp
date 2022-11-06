import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains TuistMyApp App target and TuistMyApp unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let name = "TuistMyApp"
let organizationName = "KoreaMango"

// 처음 있던 것
// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: name,
                          platform: .iOS,
                          additionalTargets: ["TuistMyAppKit", "TuistMyAppUI"])

// MARK: - docs 에 나온 메니페스트 구조
//let project = Project(
//    name: name,
//    organizationName: organizationName,
//    targets: [
//        Target(
//            name: name,
//            platform: .iOS,
//            product: .app,
//            bundleId: "io.tuist.\(name)",
//            infoPlist: "Info.plist",
//            sources: ["Sources/**"],
//            resources: ["Resources/**"],
//            headers: .headers(
//                public: ["Sources/public/A/**", "Sources/public/B/**"],
//                private: "Sources/private/**",
//                project: ["Sources/project/A/**", "Sources/project/B/**"]
//            ),
//            dependencies: [
//                /* Target dependencies can be defined here */
//                /* .framework(path: "framework") */
//            ]
//        ),
//        Target(
//            name: "\(name)Tests",
//            platform: .iOS,
//            product: .unitTests,
//            bundleId: "io.tuist.\(name)Tests",
//            infoPlist: "Info.plist",
//            sources: ["Tests/**"],
//            dependencies: [
//                .target(name: name)
//            ]
//        )
//    ]
//)
