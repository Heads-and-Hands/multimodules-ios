//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

open class NavigationRouter: BaseRouter, ParentRouter {
    // MARK: Lifecycle

    public init(navigationController: UINavigationController, parentRouter: ParentRouter? = nil, validate: ((UIViewController) -> Bool)? = nil) {
        self.parentRouter = parentRouter
        self.validate = validate

        super.init(rootController: navigationController)
    }

    // MARK: Open

    override open func set(screens: [UIViewController], animated: Bool) {
        let filteredScreens = filter(screens: screens)

        if filteredScreens.isEmpty {
            screens.forEach { _ = $0.view }
            return
        }

        let controllerAnimated: Bool
        let windowAnimated: Bool

        if navigationController?.view.window == nil {
            controllerAnimated = false
            windowAnimated = animated
        } else {
            controllerAnimated = animated
            windowAnimated = false
        }

        navigationController?.setViewControllers(filteredScreens, animated: controllerAnimated)

        if let parentRouter = parentRouter, let navigationController = navigationController {
            parentRouter.set(screen: navigationController, animated: windowAnimated)
        }
    }

    override open func add(screens: [UIViewController], animated: Bool) {
        let screens = filter(screens: screens)

        if screens.count == 1, let screen = screens.first {
            navigationController?.pushViewController(screen, animated: animated)
        } else {
            let viewControllers = (navigationController?.viewControllers ?? []) + screens
            set(screens: viewControllers, animated: animated)
        }
    }

    override open func delete(screens: [UIViewController], animated: Bool) {
        let screens = filter(screens: screens)

        let screensSet = Set(screens)
        let currentViewControllers = navigationController?.viewControllers ?? []
        let newViewControllers = currentViewControllers.filter { !screensSet.contains($0) }
        navigationController?.setViewControllers(newViewControllers, animated: animated)
    }

    override open func select(screen: UIViewController, animated: Bool) {
        navigationController?.popToViewController(screen, animated: animated)
    }

    // MARK: Internal

    // MARK: - ParentRouter

    public func set(screen: UIViewController, animated: Bool) {
        set(screens: [screen], animated: animated)
    }

    // MARK: Private

    private weak var parentRouter: ParentRouter?
    private let validate: ((UIViewController) -> Bool)?

    private var navigationController: UINavigationController? {
        rootController as? UINavigationController
    }

    private func filter(screens: [UIViewController]) -> [UIViewController] {
        if let validate = validate {
            return screens.filter(validate)
        } else {
            return screens
        }
    }
}
