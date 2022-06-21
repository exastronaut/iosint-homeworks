//
//  InfoViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 07.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let showAlert: UIButton = {
        let button = UIButton()

        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        title = "Info"

        setConstraints()

        showAlert.addTarget(self, action: #selector(showAlertTapped), for: .touchUpInside)
    }

    @objc func showAlertTapped() {
        let alert = UIAlertController(title: "Close info",
                                      message: "Do you close info?",
                                      preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: { _ in
            print("cancel")
        })

        alert.addAction(cancelAction)

        let closeAction = UIAlertAction(title: "Close",
                                      style: .destructive,
                                      handler: { _ in
            print("close")
            self.dismiss(animated: true, completion: nil)
        })

        alert.addAction(closeAction)

        present(alert, animated: true, completion: nil)
    }
}

//MARK: SetConstraints

extension InfoViewController {
    func setConstraints() {
        view.addSubview(showAlert)

        NSLayoutConstraint.activate([
            showAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showAlert.widthAnchor.constraint(equalToConstant: 100),
            showAlert.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
