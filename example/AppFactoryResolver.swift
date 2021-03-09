//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import AuthUserStory
import Routing
import UIKit

// MARK: - AppFactoryResolver

protocol AppFactoryResolver {
    func authCoordinator(from router: WindowRouter, rootVC: UINavigationController) throws -> AuthCoordinator
}

// MARK: - DependencyContainer + AppFactoryResolver

extension CommonContainer: AppFactoryResolver {
    func authCoordinator(from router: WindowRouter, rootVC: UINavigationController) throws -> AuthCoordinator {
        let router = NavigationRouter(navigationController: rootVC, parentRouter: router)
        let coordinator = AuthCoordinator(router: router, resolver: self)
        return coordinator
    }
}
