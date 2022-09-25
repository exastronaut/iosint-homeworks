//
//  RefreshTokenService.swift
//  Navigation
//
//  Created by Артем Свиридов on 25.09.2022.
//

protocol RefreshTokenServiceProtocol {

    typealias TokenResponse = (String?) -> Void

    func refreshToken(oldToken: String?, completion: @escaping TokenResponse)

}

struct RefreshTokenService: RefreshTokenServiceProtocol  {

    func refreshToken(oldToken: String?, completion: @escaping TokenResponse) {
        if oldToken != nil {
            completion(.generateToken())
        } else {
            completion(nil)
        }
    }

}
