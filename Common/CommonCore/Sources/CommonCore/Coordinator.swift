//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import Foundation

open class Coordinator<Router, Resolver> {
    init(router: Router, resolver: Resolver) {
        self.router = router
        self.resolver = resolver
    }

    public let router: Router
    public let resolver: Resolver
}
