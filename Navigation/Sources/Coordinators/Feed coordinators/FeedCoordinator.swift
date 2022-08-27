//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

import UIKit

final class FeedCoordinator {

    func makeEntryPoint() -> UIViewController {
        let viewModel = FeedViewModel()
        let view = FeedViewController(output: viewModel)
        return view
    }

}
