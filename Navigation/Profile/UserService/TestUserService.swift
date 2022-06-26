//
//  TestUserService.swift
//  Navigation
//
//  Created by Артем Свиридов on 24.06.2022.
//

final class TestUserService {

    private let user = User(
        fullname: "Test Name",
        avatar: "testAvatar",
        status: "Test Status"
    )
    
}

extension TestUserService: UserService {

    func getUser(with name: String) -> User? {
        user
    }

}
