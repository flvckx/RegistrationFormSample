//
//  ProfileCoordinator.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 09/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class ProfileCoordinator: Coordinatable & CoordinatorFinishable {

    private let router: Routable
    private let applicationServices: IAppServices

    private let profileSceneFactory: ProfileSceneFactory

    var user: User!
    
    var finishFlow: ((Any?) -> Void)?

    init(router: Routable, applicationServices: IAppServices) {
        self.router = router
        self.applicationServices = applicationServices

        self.profileSceneFactory = ProfileSceneFactory()
    }

    func start() {
        showProfileView()
    }

    private func showProfileView() {
        let scene = profileSceneFactory.scene(user: user, services: applicationServices)
        router.setRootModule(scene.view)
    }
}
