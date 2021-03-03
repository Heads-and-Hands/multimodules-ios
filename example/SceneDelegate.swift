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

        let window = UIWindow(windowScene: scene)

        guard let resourcePath = Bundle.main.path(forResource: "AuthUserStory_AuthUserStory", ofType: "bundle"),
              let bundle = Bundle(path: resourcePath) else {
            return
        }

        let storyboard = UIStoryboard(name: "Auth", bundle: bundle)
        window.rootViewController = storyboard.instantiateInitialViewController()
        window.makeKeyAndVisible()
        self.window = window

        /// Не знаю что происходит, но надо загрузить все бандлы
        if let resourcePath2 = Bundle.main.path(forResource: "CatalogUserStory_CatalogUserStory", ofType: "bundle"),
              let bundle2 = Bundle(path: resourcePath2) {
            bundle2.load()
        }
    }
}
