//
// plg
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import AuthUserStory
import Dip
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: Internal

    private let container = DependencyContainer.configure()

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            return
        }

        let window = UIWindow(windowScene: scene)
        window.rootViewController = try? container.resolve() as AuthViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}
