//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var loginInspector: LoginInspector

    init(_ loginInspector: LoginInspector) {
        self.loginInspector = loginInspector
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let feedNavigationController = createNavigationController(
            viewController: FeedViewController(),
            itemName: "Feed",
            itemImage: "house"
        )


        let loginViewController = LogInViewController()
        loginViewController.delegate = loginInspector

        let logInNavigationController = createNavigationController(
            viewController: loginViewController,
            itemName: "Profile",
            itemImage: "person"
        )

        viewControllers = [feedNavigationController, logInNavigationController]
    }

    private func createNavigationController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)),
                                tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item

        return navigationController
    }
}
