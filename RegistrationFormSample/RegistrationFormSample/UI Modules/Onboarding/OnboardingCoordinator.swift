//
//  OnboardingCoordinator.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: Coordinatable & CoordinatorFinishable {

    private let router: Routable
    private let applicationServices: IAppServices

    private let signupSceneFactory: SignupSceneFactory
    
    var finishFlow: ((Any?) -> Void)?
    
    init(router: Routable, applicationServices: IAppServices) {
        self.router = router
        self.applicationServices = applicationServices

        self.signupSceneFactory = SignupSceneFactory()
    }
    
    func start() {
        var scene = signupSceneFactory.scene(services: applicationServices)
        
        scene.viewModel.onNextTouch = {
            
        }

        router.setRootModule(scene.view)
    }
}
