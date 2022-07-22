//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 22.07.2022.
//

import UIKit

final class ProfileCoordinator {

    func open(navigationController: UINavigationController) {
        let view = ProfileViewController()
        navigationController.pushViewController(view, animated: true)
    }

    func pop(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }

}
