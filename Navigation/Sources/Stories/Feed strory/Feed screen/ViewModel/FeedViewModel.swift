//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

import UIKit

protocol FeedModuleOutput: AnyObject {

    func didTapButton()

}

final class FeedViewModel {

    var moduleOutput: FeedModuleOutput?

    var stateChanged: ((State) -> Void)?

    private(set) var state: State = .initial {
        didSet {
            stateChanged?(state)
        }
    }

}

// MARK: - Private functions

private extension FeedViewModel {

    func changeState(_ action: Action) {
        switch action {
        case .viewIsReady:
            ()
        case .didTapButton:
            moduleOutput?.didTapButton()
        }
    }

}

// MARK: - FeedViewOutput

extension FeedViewModel: FeedViewOutput {

    func didTapButton() {
        changeState(.didTapButton)
    }

}

// MARK: - Action

extension FeedViewModel {

    enum Action {
        case viewIsReady
        case didTapButton
    }

}

// MARK: - State

extension FeedViewModel {

    enum State {
        case initial
    }

}
