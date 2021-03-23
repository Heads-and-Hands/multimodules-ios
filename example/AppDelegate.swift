//
// plg
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit
import ServiceSportmaster

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Internal

    var window: UIWindow?

    let privateWindow = UIWindow(frame: UIScreen.main.bounds)

    lazy var modules: [UIApplicationDelegate] = [
        ServiceSportmaster.Module(window: privateWindow, container: Assembly.container, mainModule: true)
    ]

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        modules.forEach {
            _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }
}
