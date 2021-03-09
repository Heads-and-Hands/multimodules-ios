//
// plg
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit
import Routing
import AuthUserStory

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: Internal

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        do {
            guard let scene = scene as? UIWindowScene else {
                return
            }

            let window = UIWindow(windowScene: scene)
            let router = WindowRouter(window: window)
            let appCoordinator = AppCoordinator(router: router, resolver: resolver)

            self.window = window
            self.appCoordinator = appCoordinator

            try appCoordinator.start()
        } catch {
        }
    }

    private let resolver = CommonContainer()
    private var appCoordinator: AppCoordinator?
}
