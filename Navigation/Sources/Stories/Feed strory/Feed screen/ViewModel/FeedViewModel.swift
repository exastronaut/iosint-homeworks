//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.07.2022.
//

final class FeedViewModel {

    private let coordinator: FeedCoordinator
    var stateChanged: ((State) -> Void)?

    private(set) var state: State = .initial {
        didSet {
            stateChanged?(state)
        }
    }

    init(coordinator: FeedCoordinator) {
        self.coordinator = coordinator
    }

    func changeState(_ action: Action) {
        switch action {
        case .viewIsReady:
            state = .loading
        case .didTapButton:
            print("didTapButton")
        }
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
        case loading
        case loaded
        case error
    }

}
