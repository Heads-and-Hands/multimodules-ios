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

        container.register(.unique) { ApiProvider() }

        return container
    }()
}
