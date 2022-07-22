//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

import UIKit

final class FeedCoordinator {

    func open(navigationController: UINavigationController, coordinator: FeedCoordinator) {
        let viewModel = FeedViewModel(coordinator: coordinator)
        let view = FeedViewController(viewModel: viewModel)
        navigationController.pushViewController(view, animated: true)
    }

    func pop(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }

}
