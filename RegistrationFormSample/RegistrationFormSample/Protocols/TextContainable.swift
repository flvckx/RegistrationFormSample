//
//  TextContainable.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol TextContainable {
    var text: String? { get }
    var isValid: Bool { get set }
    var onTextChangedAction: (() -> Void)? { get set }
}
