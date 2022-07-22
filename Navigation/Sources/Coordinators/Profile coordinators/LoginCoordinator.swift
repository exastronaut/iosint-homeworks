//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 22.07.2022.
//

import UIKit

final class LoginCoordinator {

    func open(navigationController: UINavigationController) {
        let presenter = LoginPresenter(moduleOutput: self)
        let view = LoginScreen(presenter: presenter)
        presenter.view = view
        navigationController.pushViewController(view, animated: true)
    }

    func pop(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }

}

extension LoginCoordinator: LoginModuleOutput {

    func didTapButton() {
        let profile = ProfileCoordinator()
        profile.open(navigationController: UINavigationController())
    }

}
