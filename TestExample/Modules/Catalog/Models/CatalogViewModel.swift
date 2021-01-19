//
//  CatalogModel.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import Foundation

struct CatalogViewModel {
    
    var categories: [String] = []
    var products: [ProductModel] = []
    
    struct ProductModel {
        let productId: String
        let title: String
        let description: String
        let price: String
        let imageUrl: String
        let quantity: String
        let weight: String
        let sizePrice: [SizePrice]?
        let categories: String
        let categoriesId: String
    }
    
    struct SizePrice {
        let size: String
        let price: String
    }
}




