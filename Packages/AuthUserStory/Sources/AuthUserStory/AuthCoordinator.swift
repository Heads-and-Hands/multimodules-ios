import Coordinator
import Routing
import UIKit

// MARK: - AuthCoordinator

public class AuthCoordinator: BaseCoordinator<NavigationRouter, AuthResolver>, FinishableCoordinator {
    // MARK: Internal

    public var finishFlow: ThrowsClosure<Coordinator?>?

    public override func start() throws {
        try showAuth()
    }

    // MARK: Private

    private func showAuth(animated: Bool = false) throws {
        let screen = try resolver.authVC()

        screen.onButton = rethrow { [weak self] in
            try self?.showCatalog()
        }

        router.set(screen: screen, animated: animated)
    }

    private func showCatalog() throws {
        try startNext(resolver.catalogCoordinator(from: router)) { [weak self] coordinator in
            self?.removeDependency(coordinator)
        }
    }
}
