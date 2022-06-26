//
//  LoginInspector.swift
//  Navigation
//
//  Created by Артем Свиридов on 26.06.2022.
//

final class LoginInspector: LoginViewControllerDelegate {

    let checker = Checker.shared

    func didCheckLogIn(login: String, password: String) -> Bool {

        return checker.didCheckLogIn(login: login, password: password)
    }

}
