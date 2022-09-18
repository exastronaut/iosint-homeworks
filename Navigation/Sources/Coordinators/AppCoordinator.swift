//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 28.08.2022.
//

import UIKit

final class AppCoordinator {

    // MARK: - Public

    // MARK: Variables

    static let shared = AppCoordinator()

    private let window = UIWindow()

    // MARK: - Initialization

    private init(){}

    // MARK: - Public functions

    func start() -> UIViewController {
        if UserAuthorization.isAuthorized {
            return runMainFlow()
        } else {
            return runAuthFlow()
        }
    }

}

// MARK: - Private functions

private extension AppCoordinator {

    func runAuthFlow() -> UIViewController {
        let loginCoordinator = LoginCoordinator(output: self)
        return loginCoordinator.makeEntryPoint()
    }

    func runMainFlow()  -> UIViewController {
        let mainCoordinator = MainCoordinator()
        return mainCoordinator.makeTabScreen()
    }
    
}

// MARK: - LoginCoordinatorOutput

extension AppCoordinator: LoginCoordinatorOutput {

    func didFinishAuth() {
        window.rootViewController = runMainFlow()
        window.makeKeyAndVisible()
    }

}
