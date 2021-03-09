import Coordinator
import Routing
import UIKit

// MARK: - CatalogCoordinator

public class CatalogCoordinator: BaseCoordinator<NavigationRouter, CatalogResolver>, FinishableCoordinator {
    // MARK: Internal

    public var finishFlow: ThrowsClosure<Coordinator?>?

    public override func start() throws {
        try showCatalog()
    }

    // MARK: Private

    private func showCatalog(animated: Bool = false) throws {
        let screen = try resolver.catalogVC()
        router.add(screen: screen, animated: animated)
    }
}
