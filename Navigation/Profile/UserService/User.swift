//
//  User.swift
//  Navigation
//
//  Created by Артем Свиридов on 21.06.2022.
//

protocol UserService {

    func getUser(with name: String) -> User?

}

final class User {

    let fullname: String
    let avatar: String
    let status: String

    init(
        fullname: String,
        avatar: String,
        status: String
    ) {
        self.fullname = fullname
        self.avatar = avatar
        self.status = status
    }

}

