//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit
import Dip
import CommonCore

public class Module: NSObject, UIApplicationDelegate {
    public init(window: UIWindow, container: DependencyContainer, mainModule: Bool) {
        self.window = window
        self.container = container
        self.mainModule = mainModule

        super.init()
    }

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        if mainModule {
            let navigationController = UINavigationController(nibName: nil, bundle: nil)
            let naviagationRouter = NavigationRouter(navigationController: navigationController)
            

            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }

        return true
    }

    public var window: UIWindow?

    private let container: DependencyContainer
    private let mainModule: Bool
}

/*
func splashCoordinator(force: Bool, from router: WindowRouter) throws -> SplashCoordinator {
    let rootVC: UINavigationController = try resolve()
    let router = NavigationRouter(navigationController: rootVC, parentRouter: router)
    let coordinator = SplashCoordinator(router: router, resolver: self)
    coordinator.forceAuth = force
    return coordinator
}
*/
