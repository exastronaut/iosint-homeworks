//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

final class FeedViewModel {

    var stateChanged: ((State) -> Void)?

    private(set) var state: State = .initial {
        didSet {
            stateChanged?(state)
        }
    }

    func changeState(_ action: Action) {
        switch action {
        case .viewIsReady:
            ()
        case .didTapButton:
            ()
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
        case didTapButton
    }

}
