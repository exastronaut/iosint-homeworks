//
//  UserDefaultsService.swift
//  Navigation
//
//  Created by Артем Свиридов on 25.09.2022.
//

import Foundation

protocol UserDefaultsServiceProtocol {

    func saveUserToken(_ token: String)
    func getUserToken() -> String?

}
struct UserDefaultsService {

    private let tokenKey = "token"

}

// MARK: - UserDefaultsServiceProtocol

extension UserDefaultsService: UserDefaultsServiceProtocol {

    func saveUserToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }

    func getUserToken() -> String? {
        UserDefaults.standard.value(forKey: tokenKey) as? String
    }

}
