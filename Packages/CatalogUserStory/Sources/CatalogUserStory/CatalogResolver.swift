import Routing

public protocol CatalogResolver {
    func catalogVC() throws -> CatalogViewController
}

extension CommonContainer: CatalogResolver {
    public func catalogVC() throws -> CatalogViewController {
        CatalogViewController()
    }
}
