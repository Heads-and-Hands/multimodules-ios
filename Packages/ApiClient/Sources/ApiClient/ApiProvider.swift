//
//  ApiProvider.swift
//  
//
//  Created by Максим Шуркин on 03.03.2021.
//

import Foundation

public class ApiProvider {
    public func load(_ completion: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion("Hello World")
        }
    }
}
