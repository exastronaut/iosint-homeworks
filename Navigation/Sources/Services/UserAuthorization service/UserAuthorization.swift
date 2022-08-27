//
//  UserAuthorization.swift
//  Navigation
//
//  Created by Артем Свиридов on 27.08.2022.
//

import Foundation

final class UserAuthorization {

    private enum Keys: String {
        case isAuthorized
    }

    static var isAuthorized: Bool! {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isAuthorized.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = Keys.isAuthorized.rawValue
            if let userAuth = newValue {
                defaults.set(userAuth, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }

    }
}
