//
//  RegistraionService.swift
//  Navigation
//
//  Created by Артем Свиридов on 25.09.2022.
//

protocol RegistrationServiceProtocol {

    typealias TokenResponse = (String?) -> Void

    func getToken(login: String, password: String, completion: @escaping TokenResponse)

}

struct RegistrationService: RegistrationServiceProtocol  {

    func getToken(login: String, password: String, completion: @escaping TokenResponse) {
        if !login.isEmpty && !password.isEmpty {
            completion(.generateToken())
        } else {
            completion(nil)
        }
    }

}
