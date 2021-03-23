
import Dip
import FeatureSportmasterMain
import FeatureProfile
import UIKit

public enum SportmasterAssembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()
        container.collaborate(with: ProfileAssembly.container)
        container.collaborate(with: SportmasterMainAssembly.container)

        container.register(.unique) {
            UINavigationController(nibName: nil, bundle: nil)
        }

        return container
    }()
}
