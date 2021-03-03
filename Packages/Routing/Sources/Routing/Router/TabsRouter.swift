//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

public final class TabsRouter {
    // MARK: Lifecycle

    init(parentRouter: ParentRouter) {
        self.parentRouter = parentRouter
    }

    // MARK: Internal

    func set(tabbarController: UITabBarController, animated: Bool) {
        self.tabbarController = tabbarController

        parentRouter?.set(screen: tabbarController, animated: animated)
    }

    // MARK: Private

    private weak var parentRouter: ParentRouter?
    private weak var tabbarController: UITabBarController?
}
