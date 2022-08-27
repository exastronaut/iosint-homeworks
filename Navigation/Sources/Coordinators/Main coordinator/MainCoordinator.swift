//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 25.07.2022.
//

import UIKit

final class MainCoordinator {

    // MARK: - Private

    private let feedViewController = Factory(navigationController: UINavigationController(), flow: .feed)
    private let profileViewController = Factory(navigationController: UINavigationController(), flow: .profile)

    // MARK: - Public

    // MARK: Functions

    func makeTabScreen() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            feedViewController.navigationController,
            profileViewController.navigationController
        ]
        return tabBarController
    }



}
