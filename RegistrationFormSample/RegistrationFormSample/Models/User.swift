//
//  User.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

struct User {
    let name: String
    let surname: String
    let email: String
    let phone: String
    let photo: String?
    let bio: String?

    init(name: String, surname: String, email: String, phone: String, photo: String? = nil, bio: String? = nil) {
        self.name = name
        self.surname = surname
        self.email = email
        self.phone = phone
        self.photo = photo
        self.bio = bio
    }
}
