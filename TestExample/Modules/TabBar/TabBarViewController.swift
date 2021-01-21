//
//  TabBarViewController.swift
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

protocol TabBarDisplayLogic: class {
    
}

final class TabBarViewController: UITabBarController {
    
    // MARK: - IBOutlets
    
    // MARK: - External vars
    var interactor: TabBarBusinessLogic?
    var router: (NSObjectProtocol & TabBarRoutingLogic & TabBarDataPassing)?
    
    // MARK: - Internal vars

    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        TabBarConfigurator.shared.configure(self)
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        TabBarConfigurator.shared.configure(self)
    }
  
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - IBActions
}

// MARK: - Display logic
extension TabBarViewController: TabBarDisplayLogic {
    
}

// MARK: - Private methods
private extension TabBarViewController {
    
    func setupView() {
        setupTabBar()
    }
    
    func setupTabBar() {
        guard let catalogVC = R.storyboard.catalog.catalogViewController() else {
            return
        }
        guard let cardVC = R.storyboard.card.cardViewController() else {
            return
        }
        
        catalogVC.tabBarItem.image = UIImage(named: "Home")
        cardVC.tabBarItem.image = UIImage(named: "Card")
        
        catalogVC.tabBarItem.title = "Catalog"
        cardVC.tabBarItem.title = "Card"
        
//        let catalogNav = UINavigationController(rootViewController: catalogVC)
//        catalogNav.navigationBar.tintColor = .black
//        catalogVC.navigationItem.backButtonTitle = ""
        
        setViewControllers([catalogVC,cardVC], animated: false)
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.504858315, blue: 0.1311710775, alpha: 1)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }
}