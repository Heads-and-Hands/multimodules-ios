//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit
import CommonCore
import Dip

// TODO: Запихнуть айди
public enum SportmasterMainRouteId: String {
    case dashboard = "SportmasterMainRouteId"
}

public enum SportmasterMainRoute: String, Route {
    case profile
    case afisha
}

// TODO: Finish flow
class SportmasterMainCoordinator: NavigationCoordinator {
    var mainScreenFactory: (() throws -> MainScreen)?
    var routeFactory: ((SportmasterMainRoute) throws -> CoordinatorProtocol)?

    override func start() {
        guard let screen = try? mainScreenFactory?() else {
            return
        }

        print("SportmasterMainCoordinator start")

        // TODO: Родительского дочерние связи
        screen.openAfisha = {
            do {
                try self.routeFactory?(.afisha).start()
            } catch {
                print("Error \(error)")
            }
        }

        screen.openProfile = {
            do {
                guard let coordinator = try self.routeFactory?(.profile) else {
                    return
                }

                coordinator.start()

                if let navigation = coordinator.contextController as? UINavigationController {
                    if let controller = navigation.viewControllers.last {
                        self.push(controller: controller, animated: true)
                    }
                }
            } catch {
                print("Error \(error)")
            }
        }

        push(controller: screen, animated: true)
    }
}

// MARK: - Assembly

public enum SportmasterMainAssembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()

        container.register(.unique) {
            MainScreen(nibName: nil, bundle: nil)
        }

        container
            .register(.unique, tag: SportmasterMainRouteId.dashboard.rawValue) { () -> CoordinatorProtocol in
                let coordinator = SportmasterMainCoordinator(navigationController: try container.resolve())
                coordinator.mainScreenFactory = { try container.resolve() }
                coordinator.routeFactory = { tag in try container.resolve(tag: tag.rawValue) }
                return coordinator
            }

        return container
    }()
}

