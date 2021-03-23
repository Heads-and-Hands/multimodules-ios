//
//  Assembly.swift
//  example
//
//  Created by basalaev on 23.03.2021.
//  Copyright © 2021 Heads and Hands. All rights reserved.
//

import Dip
import ServiceSportmaster

public enum Assembly {
    public static let container: DependencyContainer = {
        let container = DependencyContainer()
        container.collaborate(with: SportmasterAssembly.container)
        return container
    }()
}
