import CatalogUserStory
import Routing

public protocol AuthResolver {
    func authVC() throws -> AuthViewController
    func catalogCoordinator(from router: NavigationRouter) throws -> CatalogCoordinator
}

extension CommonContainer: AuthResolver {
    public func authVC() throws -> AuthViewController {
        AuthViewController()
    }

    public func catalogCoordinator(from router: NavigationRouter) throws -> CatalogCoordinator {
        CatalogCoordinator(router: router, resolver: self)
    }
}
