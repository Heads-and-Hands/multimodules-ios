//
//  File.swift
//  
//
//  Created by Eugene Sorokin on 28.02.2021.
//

import Combine
import Foundation

class CatalogProvider {
    // MARK: Internal

    func fetchCatalog(completion: @escaping (Result<[Product], CatalogApiClientError>) -> Void ) {
        request = apiClient.catalog()
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { result in
                    guard case let .failure(error) = result else {
                        return
                    }

                    completion(.failure(error))
                    print(error.localizedDescription)
                },
                receiveValue: {
                    completion(.success($0))
                }
            )
    }

    // MARK: Private

    private let apiClient: CatalogApiClient =  CatalogApiClient()

    private var request: AnyCancellable? {
        didSet {
            oldValue?.cancel()
        }
    }
}
