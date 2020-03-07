//
//  OnboardingCoordinatorFactory.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import Foundation

class OnboardingCoordinatorFactory: ICoordinatorFactory {
    func create(router: Routable, services: IAppServices) -> Coordinatable & CoordinatorFinishable {
        return OnboardingCoordinator(router: router, applicationServices: services)
    }
}
