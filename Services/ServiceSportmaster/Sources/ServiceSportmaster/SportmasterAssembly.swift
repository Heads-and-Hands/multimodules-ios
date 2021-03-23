
import Dip
import FeatureSportmasterMain
import FeatureProfile

public enum SportmasterAssembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()
        container.collaborate(with: ProfileAssembly.container)
        container.collaborate(with: SportmasterMainAssembly.container)
        return container
    }()
}
