//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Артем Свиридов on 21.06.2022.
//

final class CurrentUserService {

    private var user: User

    init(_ user: User) {
        self.user = user
    }

}

extension CurrentUserService: UserService {

    func getUser(with name: String) -> User? {
        return name == user.fullname ? user : nil
    }

}
