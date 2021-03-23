//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import Foundation
import CommonCore
import Dip

class SportmasterMainCoordinator: Coordinator<NavigationRouter, MainScreenResolver> {
    func start() throws {
        // TODO: Снабдить экран внешними роутами

        let screen = try resolver.mainScreen()
        router.push(controller: screen, animated: true)
    }
}

// MARK: - Resolver

protocol MainScreenResolver {
    func mainScreen() throws -> MainScreen
}

extension DependencyContainer: MainScreenResolver {
    func mainScreen() throws -> MainScreen {
        try resolve()
    }
}

// MARK: - Assembly

public enum SportmasterMainAssembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()

        container.register(.unique) {
            MainScreen(nibName: nil, bundle: nil)
        }

        return container
    }()
}

