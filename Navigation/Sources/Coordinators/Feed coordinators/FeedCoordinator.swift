//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

import UIKit

final class FeedCoordinator {

    private(set) weak var presenter: UINavigationController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func makeEntryPoint() -> UIViewController {
        let viewModel = FeedViewModel()
        viewModel.moduleOutput = self
        let view = FeedViewController(output: viewModel)
        return view
    }

}

extension FeedCoordinator: FeedModuleOutput {

    func didTapButton() {
        print("didTapButton")
    }

}
