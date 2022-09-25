//
//  BrutForceService.swift
//  Navigation
//
//  Created by Артем Свиридов on 19.09.2022.
//

final class BrutForceService {

    //MARK: - Public functions

    func bruteForce(passwordToUnlock: String) {
        let ALLOWED_CHARACTERS: [String] = String().printable.map { String($0) }

        var password: String = ""

        while password != passwordToUnlock {
            password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
        }
    }

    func generatePassword(length: Int) -> String {
        let passwordCharacters = String().uppercase + String().lowercase + String().digits
        return String((0..<length).compactMap { _ in passwordCharacters.randomElement() })
    }

}

//MARK: - Private functions

private extension BrutForceService {

    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var str: String = string

        if str.count <= 0 {
            str.append(characterAt(index: 0, array))
        }
        else {
            str.replace(at: str.count - 1,
                        with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

            if indexOf(character: str.last!, array) == 0 {
                str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
            }
        }

        return str
    }

    func indexOf(character: Character, _ array: [String]) -> Int {
        array.firstIndex(of: String(character))!
    }

    func characterAt(index: Int, _ array: [String]) -> Character {
        index < array.count ? Character(array[index]) : Character("")
    }

}
