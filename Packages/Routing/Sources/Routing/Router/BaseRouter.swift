//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

open class BaseRouter: Router {
    // MARK: Lifecycle

    public init(rootController: UIViewController) {
        self.rootController = rootController
    }

    // MARK: Open

    open func set(screens _: [UIViewController], animated _: Bool) {}
    open func add(screens _: [UIViewController], animated _: Bool) {}
    open func delete(screens _: [UIViewController], animated _: Bool) {}
    open func select(screen _: UIViewController, animated _: Bool) {}

    // MARK: Public

    public weak var rootController: UIViewController?
}
