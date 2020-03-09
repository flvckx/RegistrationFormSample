//
//  VerificationSceneFactory.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import Foundation

final class VerificationSceneFactory: SceneFactory {

    typealias Scene = (view: Presentable, viewModel: IVerificationViewModel)

    func scene(user: User, services: IAppServices) -> Scene {
        guard let view = R.storyboard.onboarding.verificationForm() else {
           fatalError("Unable to initiate controller with ID: verificationForm")
        }
        let imagePicker = ImagePicker(presentationController: view, delegate: view)
        
        let viewModel = VerificationViewModel(user: user, imagePicker: imagePicker)
        view.viewModel = viewModel

        return (view: view, viewModel: viewModel)
    }
}
