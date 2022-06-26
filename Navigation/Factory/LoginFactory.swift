//
//  LoginFactory.swift
//  Navigation
//
//  Created by Артем Свиридов on 26.06.2022.
//

protocol LoginFactory {

    func getLoginInspector() -> LoginInspector

}

final class LoginFactoryImp: LoginFactory {

    func getLoginInspector() -> LoginInspector {
        LoginInspector()
    }

}

final class LoginManager {

    static func makeLoginFactory() -> LoginFactory {
        LoginFactoryImp()
    }

}
