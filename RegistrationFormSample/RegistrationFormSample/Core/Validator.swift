//
//  Validator.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import Foundation

struct Regulations {
    // swiftlint:disable line_length
    static let mailRegulations = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    // swiftlint:enable line_length
}

public enum ValidationRules {
    case lenght(minimum: Int, maximum: Int)
    case password
    case email
}

protocol IValidator {
    associatedtype T

    static func validate(_ object: T, with rule: ValidationRules) -> Bool
}

public final class StringValidator: IValidator {
    typealias T = String

    public static func validate(_ object: String, with rule: ValidationRules) -> Bool {
        switch rule {
        case .email:
            let mailRule = NSPredicate(format: "SELF MATCHES %@", Regulations.mailRegulations)
            return mailRule.evaluate(with: object)
        case let .lenght(minimum, maximum):
            return object.count >= minimum && object.count <= maximum
        case .password:
            return object.count >= 8 && object.count <= 24 && object.rangeOfCharacter(from: .decimalDigits) != nil
        }
    }
}
