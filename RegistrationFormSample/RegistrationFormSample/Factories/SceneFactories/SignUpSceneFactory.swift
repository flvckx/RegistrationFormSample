//
//  SignUpSceneFactory.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import Foundation

final class SignupSceneFactory: SceneFactory {

    typealias Scene = (view: Presentable, viewModel: OnboardingViewModelOutput)

    func scene(services: IAppServices) -> (view: Presentable, viewModel: OnboardingViewModelOutput) {
        let viewModel = OnboardingViewModel(citiesNetworkService: services.citiesNetworkService)

        guard let view = R.storyboard.onboarding.registrationForm() else {
            fatalError("Unable to initiate controller with ID: registrationForm")
        }
        view.viewModel = viewModel

        return (view: view, viewModel: viewModel)
    }
}
