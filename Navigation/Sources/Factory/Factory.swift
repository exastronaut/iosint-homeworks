//
//  Factory.swift
//  Navigation
//
//  Created by Артем Свиридов on 24.08.2022.
//

import UIKit

final class Factory {

    var navigationController: UINavigationController
    let flow: Flow

    init(navigationController: UINavigationController, flow: Flow) {
        self.navigationController = navigationController
        self.flow = flow
        startModule()
    }


}

private extension Factory {

    func startModule() {
        switch flow {
        case .feed:
            let feedCoordinator = FeedCoordinator(presenter: navigationController)
            navigationController = createNavigationController(
                viewController: feedCoordinator.makeEntryPoint(),
                itemName: Constants.feedName,
                itemImage: Constants.feedImage
            )
        case .profile:
            let profileCoordinator = ProfileCoordinator()
            navigationController = createNavigationController(
                viewController: profileCoordinator.makeEntryPoint(),
                itemName: Constants.profileName,
                itemImage: Constants.profileImage
            )
        }
    }

    private func createNavigationController(
        viewController: UIViewController,
        itemName: String,
        itemImage: String
    ) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(
                                    top: 10,
                                    left: 0,
                                    bottom: 0,
                                    right: 0
                                )),
                                tag: 0
        )
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item

        return navigationController
    }

}

extension Factory {

    enum Flow {
        case feed, profile
    }

}

extension Factory {

    enum Constants {
        static let feedName = "Feed"
        static let feedImage = "house"
        static let profileName = "Profile"
        static let profileImage = "person"
    }

}
