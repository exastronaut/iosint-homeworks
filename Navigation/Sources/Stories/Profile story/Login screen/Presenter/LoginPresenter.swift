//
//  LoginPresenter.swift
//  Navigation
//
//  Created by Артем Свиридов on 21.07.2022.
//

import UIKit

protocol LoginModuleOutput: AnyObject {

    func didTapButton()

}

final class LoginPresenter {

    // MARK: - Private

    // MARK: External dependencies

    weak var view: LoginScreenInput!
    private var moduleOutput: LoginModuleOutput

    // MARK: - Initialization

    init(moduleOutput: LoginModuleOutput) {
        self.moduleOutput = moduleOutput
    }

}

extension LoginPresenter: LoginScreenInput {}

extension LoginPresenter: LoginScreenOutput {

    func didTapButton() {
        moduleOutput.didTapButton()
    }

}

