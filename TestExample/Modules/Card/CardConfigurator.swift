//
//  CardConfigurator.swift
//  TestExample
//
//  Created by Игорь Дикань on 20.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import UIKit

final class CardConfigurator {
    
    static let shared = CardConfigurator()
    private init() {}
    
    func configure(_ viewController: CardViewController) {
        let interactor = CardInteractor()
        let presenter = CardPresenter()
        let router = CardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}