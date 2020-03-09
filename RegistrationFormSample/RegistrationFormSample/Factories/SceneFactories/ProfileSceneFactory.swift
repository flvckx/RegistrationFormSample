//
//  ProfileSceneFactory.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 09/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//


final class ProfileSceneFactory: SceneFactory {

    typealias Scene = (view: Presentable, viewModel: ProfileViewModelOutput)

    func scene(user: User, services: IAppServices) -> Scene {
        let viewModel = ProfileViewModel(user: user)

        guard let view = R.storyboard.profile.profileView() else {
            fatalError("Unable to initiate controller with ID: profileView")
        }
        view.viewModel = viewModel

        return (view: view, viewModel: viewModel)
    }
}
