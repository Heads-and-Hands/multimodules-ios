//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import Foundation
import CommonCore
import Dip

// TODO: Запихнуть айди
public enum SportmasterMainRouteId: String {
    case dashboard
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
                try self.routeFactory?(.profile).start()
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
            .register(.unique) {
                SportmasterMainCoordinator(navigationController: try container.resolve())
            }
            .resolvingProperties { container, coordinator in
                coordinator.mainScreenFactory = { try container.resolve() }
                coordinator.routeFactory = { tag in try container.resolve(tag: tag.rawValue) }
            }
            .implements(CoordinatorProtocol.self, tag: SportmasterMainRouteId.dashboard.rawValue)

        return container
    }()
}

