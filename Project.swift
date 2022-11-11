import ProjectDescription
import Foundation
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

// MARK: - Environment
let tuistDeploy = ProcessInfo.processInfo.environment["TUIST_DEPLOY"]
let isDeploy = (tuistDeploy == "App")

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "TuistMyApp",
                          platform: .iOS,
                          additionalTargets: [],
                          isDeploy: isDeploy)
