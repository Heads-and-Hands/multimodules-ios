//
//  example
//  Copyright © 2021 Heads and Hands. All rights reserved.
//

import ApiClient
import AuthUserStory
import CatalogUserStory
import Dip

extension DependencyContainer {
    static func configure() -> DependencyContainer {
        DependencyContainer {
            $0.collaborate(with: [
                ApiClient.Assembly.container,
                AuthUserStory.Assembly.container,
                CatalogUserStory.Assembly.container
            ])
        }
    }
}
