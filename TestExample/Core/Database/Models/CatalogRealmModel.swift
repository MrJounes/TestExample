//
//  CatalogRealmModel.swift
//  TestExample
//
//  Created by Игорь Дикань on 21.01.2021.
//

import Foundation
import RealmSwift

class CatalogRealmModel: Object {
    
    var categories = List<String>()
    var products = List<ProductRealmModel>()
    
    convenience init(categories: List<String>, products: List<ProductRealmModel>) {
        self.init()
        self.categories = categories
        self.products = products
    }
}

class ProductRealmModel: Object {
    @objc dynamic var productId: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var descrip: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var quantity: Int = 0
    @objc dynamic var weight: String = ""
    //var sizePrice = List<SizePriceRealmModel?>()
    @objc dynamic var categories: String = ""
    @objc dynamic var categoriesId: String = ""
    
    convenience init(productId: String,
                     title: String,
                     descrip: String,
                     price: String,
                     imageUrl: String,
                     quantity: Int,
                     weight: String,
                     //sizePrice: List<SizePriceRealmModel?>,
                     categories: String,
                     categoriesId: String) {
        self.init()
        self.productId = productId
        self.title = title
        self.descrip = descrip
        self.price = price
        self.imageUrl = imageUrl
        self.quantity = quantity
        self.weight = weight
        //self.sizePrice = sizePrice
        self.categories = categories
        self.categoriesId = categoriesId
    }
}

class SizePriceRealmModel: Object {
    @objc dynamic var size: String = ""
    @objc dynamic var price: String = ""
    
    convenience init(size: String, price: String) {
        self.init()
        self.size = size
        self.price = price
    }
}
