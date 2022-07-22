//
//  FeedViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    // MARK: External dependencies

    private let viewModel: FeedViewModel

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private lazy var showFirstPost: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("First post", for: .normal)
        button.addTarget(self, action: #selector(showPostTapped), for: .touchUpInside)
        return button
    }()

    private lazy var showSecondPost: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Second post", for: .normal)
        button.addTarget(self, action: #selector(showPostTapped), for: .touchUpInside)
        return button
    }()

    let post = Post(title: "Post Title")

    // MARK: - Init

    init(
        viewModel: FeedViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()
        setupView()
        setupLayout()
    }


}

// MARK: - Private functions

private extension FeedViewController {

    func setupViewModel() {
        viewModel.stateChanged = { [weak self] state in
            guard let _ = self else { return }

            switch state {
            case .initial:
                ()
            case .loading:
                ()
            case .loaded:
                ()
            case .error:
                ()
            }
        }
    }

    @objc
    func showPostTapped() {
        guard let navigationController = navigationController else { return }

        let postViewController = PostViewController(post: post)
        navigationController.pushViewController(postViewController, animated: true)
    }

    func setupView() {
        view.backgroundColor = .systemPink
        title = "Feed"
    }

    func setupLayout() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        [showFirstPost, showSecondPost].forEach { stackView.addArrangedSubview($0) }
    }

}
