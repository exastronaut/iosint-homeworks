//
//  TestUserService.swift
//  Navigation
//
//  Created by Артем Свиридов on 24.06.2022.
//

final class TestUserService {

    let user = User(
        fullname: "Zhong Xina",
        avatar: "avatar",
        status: "*** *****"
    )
    
}

extension TestUserService: UserService {

    func getUser(with name: String) -> User? {
        user
    }

}
