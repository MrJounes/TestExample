//
//  AppDelegate.swift
//  TestExample
//
//  Created by Игорь Дикань on 19.01.2021.
//

import UIKit
import GoogleMaps
import GooglePlaces
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()
        setupGoogleMaps()
        setupRealmConficuration()
        return true
    }
}

// MARK: - Private methods
extension AppDelegate {

    func setupRootViewController() {
        guard let vc = R.storyboard.catalog.catalogViewController() else {
            return
        }
        let navigation = UINavigationController(rootViewController: vc)
        navigation.isNavigationBarHidden = true
        navigation.navigationBar.tintColor = .black
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func setupRealmConficuration() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
            })
        Realm.Configuration.defaultConfiguration = config
    }
    
    func setupGoogleMaps() {
//        GMSServices.provideAPIKey("AIzaSyDhlKDN2wDC-u5CNYO8By7tTvdE0qhs4CYs")
//        GMSPlacesClient.provideAPIKey("AIzaSyDhlKDN2wDC-u5CNYO8By7tTvdE0qhs4CYs")
        
        GMSServices.provideAPIKey("AIzaSyCqFSK5Jdf-cbBGQJFXOWeCtOWKzU9utqxg")
        GMSPlacesClient.provideAPIKey("AIzaSyCqFSK5Jdf-cbBGQJFXOWeCtOWKzU9utqxg")
    }
}
