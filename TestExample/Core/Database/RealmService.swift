//
//  RealmService.swift
//  TestExample
//
//  Created by Игорь Дикань on 21.01.2021.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    var realm: Realm { get }
    func create<T: Object>(_ object: T)
    func read<T: Object>(_ object: T) -> Results<T>
    func update<T: Object>(_ object: T, with dictionary: [String: Any?])
    func delete<T: Object>(_ object: T)
    func deleteAll()
}

protocol RealmObserviable {
    func post(_ error: Error)
    func observeRealmErrors(in vc: UIViewController, complition: @escaping (Error?) -> Void)
    func stopObservingErrors(in vc: UIViewController)
}

class RealmService {
    
    static let shared = RealmService()
    private init() {}
    
    var realm: Realm {
        do {
            let realm = try Realm(configuration: .defaultConfiguration)
            return realm
        } catch  {
            post(error)
            fatalError("RealmServiceError in instance initialize Realm() - \(error.localizedDescription)")
        }
    }
}

// MARK: - RealmServiceProtocol
extension RealmService: RealmServiceProtocol {
    
    // MARK: - Create
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            post(error)
            print("RealmServiceError in func create() - \(error.localizedDescription)")
        }
    }
    // MARK: - Read
    func read<T: Object>(_ object: T) -> Results<T> {
        realm.objects(T.self)
    }
    // MARK: - Update
    func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            post(error)
            print("RealmServiceError in func update() - \(error.localizedDescription)")
        }
    }
    // MARK: - Delete
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            post(error)
            print("RealmServiceError in func delete() - \(error.localizedDescription)")
        }
    }
    
    func deleteAll() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            post(error)
            print("RealmServiceError in func delete() - \(error.localizedDescription)")
        }
    }
}

// MARK: - RealmObserviable
extension RealmService: RealmObserviable {
    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: Notification.Name("RealmError"), object: error)
    }
    
    func observeRealmErrors(in vc: UIViewController, complition: @escaping (Error?) -> Void) {
        NotificationCenter.default.addObserver(forName: Notification.Name("RealmError"), object: nil, queue: nil) { (notification) in
            complition(notification.object as? Error)
        }
    }
    
    func stopObservingErrors(in vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc, name: Notification.Name("RealmError"), object: nil)
    }
}
