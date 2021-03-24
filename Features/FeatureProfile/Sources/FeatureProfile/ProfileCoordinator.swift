//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import Foundation
import CommonCore
import Dip

public enum ProfileRouteId: String {
    case main = "ProfileRouteId"
}

class ProfileCoordinator: NavigationCoordinator {
    var profileScreen: (() throws -> ProfileScreen)?

    override func start() {
        guard let screen = try? profileScreen?() else {
            return
        }

        print("ProfileCoordinator start")
        push(controller: screen, animated: true)
    }
}

// MARK: - Resolver

protocol ProfileResolver {
    func profileScreen() throws -> ProfileScreen
}

extension DependencyContainer: ProfileResolver {
    func profileScreen() throws -> ProfileScreen {
        try resolve()
    }
}

// MARK: - Assembly

public enum ProfileAssembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()

        container.register(.unique) {
            ProfileScreen(dataProvider: try container.resolve())
        }

        container.register(.unique) {
            ProfileDataProviderImp()
        }
        .implements(ProfileDataProvider.self)

        container
            .register(.unique, tag: ProfileRouteId.main.rawValue) { () -> CoordinatorProtocol in
                let coordinator = ProfileCoordinator(navigationController: try container.resolve())
                coordinator.profileScreen = { try container.resolve() }
                return coordinator
            }

        return container
    }()
}
