//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let feedScreen = ModuleFactory(navigationController: UINavigationController(), flow: .feed)
    private let profileScreen = ModuleFactory(navigationController: UINavigationController(), flow: .login)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    private func setupTabBar() {
        viewControllers = [feedScreen.navigationController, profileScreen.navigationController]
    }
}

