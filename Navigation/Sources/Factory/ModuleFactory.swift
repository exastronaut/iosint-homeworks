//
//  Factory.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

import UIKit

final class ModuleFactory {

    // MARK: - Initialization

    let navigationController: UINavigationController
    private let flow: Flow

    init(
        navigationController: UINavigationController,
        flow: Flow
    ) {
        self.navigationController = navigationController
        self.flow = flow

        makeModule()
    }

    // MARK: - Public functions

    func makeModule() {
        switch flow {
        case .feed:
            let coordinator = FeedCoordinator()
            coordinator.open(navigationController: navigationController, coordinator: coordinator)
            navigationController.tabBarItem.title = "Feed"
            navigationController.tabBarItem.image = UIImage(systemName: "house")
        case .login:
            let coordinator = LoginCoordinator()
            coordinator.open(navigationController: navigationController)
            navigationController.tabBarItem.title = "Profile"
            navigationController.tabBarItem.image = UIImage(systemName: "person")
        }
    }

}

// MARK: - Flow

extension ModuleFactory {

    enum Flow {
        case feed
        case login
    }

}
