//
//  UIViewController+Extension.swift
//  Navigation
//
//  Created by Артем Свиридов on 25.09.2022.
//

import UIKit

extension UIViewController {

    func showAlert() {
        let alert = UIAlertController(title: "No connection to server",
                                      message: "Please try again later",
                                      preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)

        present(alert, animated: true)
    }

}
