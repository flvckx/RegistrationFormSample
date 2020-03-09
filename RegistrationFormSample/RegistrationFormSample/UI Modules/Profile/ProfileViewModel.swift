//
//  ProfileViewModel.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 09/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol IProfileViewModel: ProfileViewModelOutput {

}

protocol ProfileViewModelOutput {
    var user: User { get }
}

final class ProfileViewModel: IProfileViewModel {

    let user: User

    init(user: User) {
        self.user = user
    }
}
