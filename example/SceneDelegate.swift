//
// plg
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit
import AuthUserStory

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: Internal

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            return
        }

        let testString = NSLocalizedString("language", bundle: Bundle(for: SceneDelegate.self), comment: "")
        print("Current language \(testString)")

        let window = UIWindow(windowScene: scene)
        window.rootViewController = AuthViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
