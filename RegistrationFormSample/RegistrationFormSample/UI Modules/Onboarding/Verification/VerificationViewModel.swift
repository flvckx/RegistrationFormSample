//
//  VerificationViewModel.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

protocol IVerificationViewModel: VerificationViewModelOutput {
    func openPicker(source: UIView)
}

protocol VerificationViewModelOutput {
    
}

class VerificationViewModel: IVerificationViewModel {

    private var user: User
    private let imagePicker: ImagePicker

    var onPhotoTouch: ((UIView) -> Void)?

    init(user: User, imagePicker: ImagePicker) {
        self.user = user
        self.imagePicker = imagePicker
    }

    func openPicker(source: UIView) {
        imagePicker.present(from: source)
    }
}
