//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit
import Dip
import CommonCore
import FeatureSportmasterMain

public class Module: NSObject, UIApplicationDelegate {
    public init(window: UIWindow, container: DependencyContainer, mainModule: Bool) {
        self.window = window
        self.container = container
        self.mainModule = mainModule

        super.init()
    }

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        if mainModule {
            if let coordinator: CoordinatorProtocol = try? container.resolve(tag: SportmasterMainRouteId.dashboard.rawValue) {
                coordinator.start()

                window?.rootViewController = coordinator.contextController
                window?.makeKeyAndVisible()
            }
        }

        return true
    }

    public var window: UIWindow?

    private let container: DependencyContainer
    private let mainModule: Bool
}
