//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

// MARK: - WindowTransitionOptions

private struct WindowTransitionOptions {
    // MARK: Lifecycle

    init(direction: WindowTransitionOptions.Direction = .toRight, style: WindowTransitionOptions.Curve = .easeInOut) {
        self.direction = direction
        self.style = style
    }

    // MARK: Internal

    enum Curve {
        case linear
        case easeIn
        case easeOut
        case easeInOut

        // MARK: Internal

        var function: CAMediaTimingFunction {
            CAMediaTimingFunction(name: mediaTimingFunctionName)
        }

        // MARK: Private

        private var mediaTimingFunctionName: CAMediaTimingFunctionName {
            switch self {
            case .linear:
                return .linear
            case .easeIn:
                return .easeIn
            case .easeOut:
                return .easeOut
            case .easeInOut:
                return .easeInEaseOut
            }
        }
    }

    enum Direction {
        case fade
        case toTop
        case toBottom
        case toLeft
        case toRight

        // MARK: Internal

        var transition: CATransition {
            let transition = CATransition()
            transition.type = .push
            switch self {
            case .fade:
                transition.type = .fade
                transition.subtype = nil
            case .toLeft:
                transition.subtype = .fromLeft
            case .toRight:
                transition.subtype = .fromRight
            case .toTop:
                transition.subtype = .fromTop
            case .toBottom:
                transition.subtype = .fromBottom
            }
            return transition
        }
    }

    var duration: TimeInterval = 0.3
    var direction: WindowTransitionOptions.Direction = .toRight
    var style: WindowTransitionOptions.Curve = .easeInOut
    var backgroundColor: UIColor?

    var animation: CATransition {
        let transition = direction.transition
        transition.duration = duration
        transition.timingFunction = style.function
        return transition
    }
}

// MARK: - WindowRouter

public final class WindowRouter: ParentRouter {
    // MARK: Lifecycle

    public init(window: UIWindow) {
        self.window = window
    }

    // MARK: Internal

    public func set(screen: UIViewController, animated: Bool) {
        if animated {
            window.layer.add(WindowTransitionOptions().animation, forKey: kCATransition)
        }

        window.rootViewController = screen
        window.makeKeyAndVisible()
    }

    func `switch`(to router: Router, style: UIModalPresentationStyle? = nil, animated: Bool) {
        guard
            let destinationVC = router.rootController,
            let rootController = window.rootViewController,
            let currentController = topViewController(for: rootController)
        else {
            return
        }

        if let style = style {
            destinationVC.modalPresentationStyle = style
        }

        currentController.present(destinationVC, animated: animated, completion: nil)
    }

    func beginUpdates() {
        bufferedRootVC = window.rootViewController
    }

    func commitUpdates() {
        // TODO: Очистить всю память
        bufferedRootVC = nil
    }

    func restoreState() {
        if let bufferedRootVC = bufferedRootVC {
            set(screen: bufferedRootVC, animated: true)
            self.bufferedRootVC = nil
        }
    }

    // MARK: Private

    private let window: UIWindow

    private var bufferedRootVC: UIViewController?

    private func topViewController(for viewController: UIViewController) -> UIViewController? {
        if let presentedViewController = viewController.presentedViewController {
            return topViewController(for: presentedViewController)
        }

        return viewController
    }
}
