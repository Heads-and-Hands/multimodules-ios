//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import Coordinator
import Routing
import UIKit

final class AppCoordinator: BaseCoordinator<WindowRouter, AppFactoryResolver> {
    // MARK: Internal

    override func start() throws {
        try startSplash()
    }

    // MARK: Private

    private let rootVC = UINavigationController()

    private func startSplash() throws {
        try startNext(resolver.authCoordinator(from: router, rootVC: rootVC)) { [weak self] coordinator in
            self?.removeDependency(coordinator)
        }
    }
}
