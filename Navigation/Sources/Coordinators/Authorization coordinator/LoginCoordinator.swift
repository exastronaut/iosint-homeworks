//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 22.07.2022.
//

import UIKit

protocol LoginCoordinatorOutput: AnyObject {

    func didFinishAuth()

}

final class LoginCoordinator {

    // MARK: - Private

    // MARK: External dependencies

    private weak var output: LoginCoordinatorOutput?

    // MARK: - Initialization

    init(output: LoginCoordinatorOutput?) {
        self.output = output
    }

    // MARK: - Public functions

    func makeEntryPoint() -> UIViewController {
        let view = LoginScreen()
        let presenter = LoginPresenter(view: view)
        presenter.moduleOutput = self
        view.output = presenter
        return view
    }
    
}

// MARK: - LoginModuleOutput

extension LoginCoordinator: LoginModuleOutput {

    func didTapButton() {
        output?.didFinishAuth()
    }

}
