import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin
import Foundation

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
let tuistDependencies =  ProcessInfo.processInfo.environment["TUIST_EXCEPT_FRAMEWORK"]
let isExceptDepen = (tuistDependencies == "Y")

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "TuistMyApp",
                          platform: .iOS,
                          additionalTargets: ["TuistMyAppKit", "TuistMyAppUI"],
                          isExceptDepen: isExceptDepen)
