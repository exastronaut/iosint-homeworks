//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 18.07.2022.
//

import UIKit

protocol MainCoordinator {

    func runApplication() -> UIViewController

}

final class MainCoordinatorImp: MainCoordinator {

    func runApplication() -> UIViewController {
        MainTabBarController()
    }

}
