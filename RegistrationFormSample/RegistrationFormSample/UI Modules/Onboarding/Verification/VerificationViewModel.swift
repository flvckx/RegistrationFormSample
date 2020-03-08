//
//  VerificationViewModel.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol IVerificationViewModel {

}

protocol VerificationViewModelOutput {
    
}

class VerificationViewModel: IVerificationViewModel {

    private var user: User

    init(user: User) {
        self.user = user
    }
    
}
