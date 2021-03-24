
import Dip
import FeatureSportmasterMain
import FeatureProfile
import UIKit
import CommonCore

public enum SportmasterAssembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()
        container.collaborate(with: ProfileAssembly.container)
        container.collaborate(with: SportmasterMainAssembly.container)

        container.register(.unique) {
            UINavigationController(nibName: nil, bundle: nil)
        }

        container
            .register(.unique, tag: SportmasterMainRoute.profile.rawValue) { () -> CoordinatorProtocol in
                try container.resolve(tag: ProfileRouteId.main.rawValue)
            }

        return container
    }()
}
