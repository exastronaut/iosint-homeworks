//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 22.07.2022.
//

import UIKit

final class LoginCoordinator {

    func makeEntryPoint() -> UIViewController {
        let view = LoginScreen()
        let presenter = LoginPresenter(view: view)
        presenter.moduleOutput = self
        view.output = presenter
        return view
    }
    
}

extension LoginCoordinator: LoginmoduleOutput {

    func didTapButton() {}

}
