//
//  Checker.swift
//  Navigation
//
//  Created by Артем Свиридов on 26.06.2022.
//

final class Checker {

    private let login = "bandit228"
    private let pswd = "qwerty"


    static let shared = Checker()

    private init() {}
    
}

extension Checker: LoginViewControllerDelegate {

    func didCheckLogIn(login: String, password: String) -> Bool {
        self.login.hash == login.hash && pswd.hash == password.hash 
    }

}
