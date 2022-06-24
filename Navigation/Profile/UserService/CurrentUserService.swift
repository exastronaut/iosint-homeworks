//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Артем Свиридов on 21.06.2022.
//

final class CurrentUserService {

    var user: User?

}

extension CurrentUserService: UserService {

    func getUser(with name: String) -> User? {
        return name == user?.fullname ? user : nil
    }

}
