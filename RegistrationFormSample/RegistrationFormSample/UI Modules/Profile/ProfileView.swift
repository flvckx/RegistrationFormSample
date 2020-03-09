//
//  ProfileView.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 09/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class ProfileView: UIViewController {

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var surnameLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var phoneLabel: UILabel!
    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var bioLabel: UILabel!

    var viewModel: IProfileViewModel!

    override func loadView() {
        super.loadView()
        setUpView()
    }
}

// MARK: - Private

private extension ProfileView {

    func setUpView() {
        profileImageView.image = viewModel.user.photo
        nameLabel.text = viewModel.user.name
        surnameLabel.text = viewModel.user.surname
        emailLabel.text = viewModel.user.email
        phoneLabel.text = viewModel.user.phone
        cityLabel.text = viewModel.user.city
        bioLabel.text = viewModel.user.bio
        bioLabel.numberOfLines = 0
    }
}
