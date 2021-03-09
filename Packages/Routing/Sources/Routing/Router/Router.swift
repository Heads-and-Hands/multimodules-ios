//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

// MARK: - Router

public protocol Router {
    var rootController: UIViewController? { get }

    func set(screens: [UIViewController], animated: Bool)
    func add(screens: [UIViewController], animated: Bool)
    func delete(screens: [UIViewController], animated: Bool)
    func select(screen: UIViewController, animated: Bool)
}

// MARK: - Operation with one controller

public extension Router {
    func set(screen: UIViewController, animated: Bool) {
        set(screens: [screen], animated: animated)
    }

    func add(screen: UIViewController, animated: Bool) {
        add(screens: [screen], animated: animated)
    }

    func delete(screen: UIViewController, animated: Bool) {
        delete(screens: [screen], animated: animated)
    }
}

// MARK: - Operation with other router

extension Router {
    func add(_ router: Router, animated: Bool) {
        guard let screen = router.rootController else {
            return
        }

        add(screen: screen, animated: animated)
    }

    /// Переключаем фокус отображения на другую "иерархию" (модальное отображение)
    /// @param router - другой контроллер
    /// @param style - показ в контексте текущего роутера, true - для алертов
    func `switch`(to router: Router, style: UIModalPresentationStyle? = nil, animated: Bool) {
        guard let destinationVC = router.rootController else {
            return
        }

        if let style = style {
            destinationVC.modalPresentationStyle = style
        }

        rootController?.present(destinationVC, animated: animated, completion: nil)
    }
}
