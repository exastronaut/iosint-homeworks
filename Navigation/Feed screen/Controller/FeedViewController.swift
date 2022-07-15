//
//  FeedViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

final class FeedViewController: UIViewController {

    // MARK: - Private

    private let post = Post(title: "Post Title")

    // MARK: UI

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private lazy var showFirstPost: CustomButton = {
        let button = CustomButton(title: "First post")
        button.delegat = self
        return button
    }()

    private lazy var showSecondPost: CustomButton = {
        let button = CustomButton(title: "Second post")
        button.delegat = self
        return button
    }()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setuplayout()
    }

}

// MARK: - Private functions

private extension FeedViewController {

    func setupView() {
        view.backgroundColor = .systemPink
        title = "Feed"
    }

    func setuplayout() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        [showFirstPost, showSecondPost].forEach { stackView.addArrangedSubview($0) }
    }

}

// MARK: - CustomButtonProtocol

extension FeedViewController: CustomButtonProtocol {

    func didTapButton() {
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
