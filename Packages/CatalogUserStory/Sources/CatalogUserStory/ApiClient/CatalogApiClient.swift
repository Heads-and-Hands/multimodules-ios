//
//  File.swift
//  
//
//  Created by Eugene Sorokin on 28.02.2021.
//

import ApiClient
import Combine
import Foundation

enum CatalogApiClientError: Error {
    case network
}

// TODO: Replace with ApiClient package implementation
class CatalogApiClient {
    typealias CatalogApiClientResult = AnyPublisher<[Product], CatalogApiClientError>

    func catalog() -> CatalogApiClientResult {
        guard
            let url = Bundle.module.url(forResource: "200_get_catalog", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let products = try? JSONDecoder().decode([Product].self, from: data)
        else {
            return Result.Publisher(CatalogApiClientError.network).eraseToAnyPublisher()
        }

        return Result.Publisher(products).eraseToAnyPublisher()
    }
}
