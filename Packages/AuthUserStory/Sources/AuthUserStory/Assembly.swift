//
//  Assembly.swift
//  
//
//  Created by Максим Шуркин on 03.03.2021.
//

import Dip

public enum Assembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()

        container.register { AuthViewController() }
            .resolvingProperties { container, vc in
                vc.apiProvider = try container.resolve()
            }

        return container
    }()
}
