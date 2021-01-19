//
//  MainRouter.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol MainRoutingLogic {
    func routeToCatalog()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

final class MainRouter: NSObject {
    
    // MARK: - External vars
    weak var viewController: MainViewController?
    weak var dataStore: MainDataStore?
}

// MARK: - Routing logic
extension MainRouter: MainRoutingLogic {
    
    func routeToCatalog() {
        guard let catalogVC = R.storyboard.catalog.catalogViewController() else {
            return
        }
        viewController?.navigationController?.pushViewController(catalogVC, animated: true)
    }
}

// MARK: - Data passing
extension MainRouter: MainDataPassing {
    
}
