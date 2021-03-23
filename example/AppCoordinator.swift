//
//  AppCoordinator.swift
//  example
//
//  Created by basalaev on 23.03.2021.
//  Copyright © 2021 Heads and Hands. All rights reserved.
//

/*
import Alamofire
import Coordinator
import Dip
import UIKit

final class AppCoordinator: BaseCoordinator<WindowRouter, AppFactoryResolver> {
    // MARK: Internal

    override func start() throws {
        try startTokenObserver()
        try startSplash(force: false)
    }

    #if RELEASE
    #else
        func motionEnded(motion: UIEvent.EventSubtype) {
            if motion == .motionShake {
                rethrow { [weak self] in try self?.startDebug() }()
            }
        }
    #endif

    // MARK: Private

    private func startTokenObserver() throws {
        try startNext(resolver.tokenObserveCoordinator(from: router)) { [weak self] in
            try self?.startTabbarController()
        }
    }

    private func startSplash(force: Bool) throws {
        // TODO: Роутер используемый ???
        log?.debug("[AppCoordinator] startSplash")
        try startNext(resolver.splashCoordinator(force: force, from: router)) { [weak self] coordinator in
            self?.removeDependency(coordinator)
            try self?.startTabbarController()
        }
    }

    private func startTabbarController() throws {
        log?.debug("[AppCoordinator] startTabbarController")
        try startNext(resolver.tabbarCoordinator(from: router)) { [weak self] coordinator in
            self?.removeDependency(coordinator)
            try self?.startSplash(force: true)
        }
    }

    private func startDebug() throws {
        guard !childs.contains(where: { $0 is DebugCoordinator }) else {
            return
        }

        let router = NavigationRouter(navigationController: NavigationController())
        let coordinator = resolver.debugCoordinator(router: router)
        try startNext(coordinator) { [weak self] in
            self?.removeDependency($0)
        }
        self.router.switch(to: router, style: .automatic, animated: true)
    }
}
*/
