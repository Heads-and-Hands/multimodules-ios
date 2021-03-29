//
//  File.swift
//  
//
//  Created by Eugene Sorokin on 25.02.2021.
//

import Foundation

struct CatalogCellData {
    let title: String
    let description: String
    let image: String
    let price: String
    let onSelect: (() -> Void)?
    let onAdd: (() -> Void)?
}
