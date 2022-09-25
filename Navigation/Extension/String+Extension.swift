//
//  String+Extension.swift
//  Navigation
//
//  Created by Артем Свиридов on 20.09.2022.
//

extension String {

    var digits: String { "0123456789" }
    var lowercase: String { "abcdefghijklmnopqrstuvwxyz"}
    var uppercase: String { "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    var punctuation: String { "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" }
    var letters: String { lowercase + uppercase }
    var printable: String { digits + letters + punctuation }

    mutating func replace(at index: Int, with character: Character) {
        var stringArray = Array(self)
        stringArray[index] = character
        self = String(stringArray)
    }

}
