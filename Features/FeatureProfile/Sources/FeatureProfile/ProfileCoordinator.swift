//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import Foundation
import CommonCore
import Dip

class ProfileCoordinator: Coordinator<NavigationRouter, ProfileResolver> {
    func start() throws {
        let screen = try resolver.profileScreen()
        router.push(controller: screen, animated: true)
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

        return container
    }()
}
