//
//  LoginPresenter.swift
//  Navigation
//
//  Created by Артем Свиридов on 21.07.2022.
//

protocol LoginModuleOutput {

    func didTapButton()

}

final class LoginPresenter {

    // MARK: - Private

    // MARK: External dependencies

    private unowned let view: LoginScreenInput
    var moduleOutput: LoginModuleOutput?

    // MARK: - Initialization

    init(view: LoginScreenInput) {
        self.view = view
    }
    
}

extension LoginPresenter: LoginScreenInput {}

extension LoginPresenter: LoginScreenOutput {

    func didTapButton() {
        UserAuthorization.isAuthorized = true
        moduleOutput?.didTapButton()
    }

}
