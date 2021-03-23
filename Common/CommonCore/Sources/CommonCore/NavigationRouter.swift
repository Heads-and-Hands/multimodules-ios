//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit

public class NavigationRouter {
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    private let navigationController: UINavigationController

    public func push(controller: UIViewController, animated: Bool) {
        navigationController.pushViewController(controller, animated: animated)
    }
}
