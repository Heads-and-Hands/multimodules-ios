//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit

public protocol CoordinatorProtocol {
    func start()
}

public protocol RouteId {}
public protocol Route {}

open class Coordinator<Router, Resolver> {
    init(router: Router, resolver: Resolver) {
        self.router = router
        self.resolver = resolver
    }

    public let router: Router
    public let resolver: Resolver

    open func start() throws {}
}

open class NavigationCoordinator: CoordinatorProtocol {
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    private let navigationController: UINavigationController

    open func start() {

    }

    public func push(controller: UIViewController, animated: Bool) {
        navigationController.pushViewController(controller, animated: animated)
    }
}
