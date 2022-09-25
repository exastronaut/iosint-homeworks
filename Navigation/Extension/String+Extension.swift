//
//  String+Extension.swift
//  Navigation
//
//  Created by Артем Свиридов on 25.09.2022.
//

extension String {

    static let digits = "0123456789"
    static let lowercase = "abcdefghijklmnopqrstuvwxyz"
    static let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    static func generateToken() -> String {
        let characters = String.uppercase + String.lowercase
        return String((0..<8).compactMap { _ in characters.randomElement() })
    }

}
