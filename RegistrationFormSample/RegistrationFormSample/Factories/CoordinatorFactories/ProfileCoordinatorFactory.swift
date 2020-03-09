//
//  ProfileCoordinatorFactory.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 09/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

class ProfileCoordinatorFactory: ICoordinatorFactory {
    func create(router: Routable, services: IAppServices) -> Coordinatable & CoordinatorFinishable {
        return ProfileCoordinator(router: router, applicationServices: services)
    }
}
