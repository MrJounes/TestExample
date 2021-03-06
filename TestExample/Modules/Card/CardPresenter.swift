//
//  CardPresenter.swift
//  TestExample
//
//  Created by Игорь Дикань on 20.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CardPresentationLogic {
    func presentProducts(with data: [ProductRealmModel])
}

final class CardPresenter {
    
    // MARK: - External vars
    weak var viewController: CardDisplayLogic?
}

// MARK: - Presentation logic
extension CardPresenter: CardPresentationLogic {
    
    func presentProducts(with data: [ProductRealmModel]) {
        let viewModel = data.map { (product) -> CardProductModel in
            let item = CardProductModel(productId: product.productId, title: product.title, price: product.price, size: nil)
            return item
        }
        viewController?.displayProducts(with: viewModel)
    }
}
