//
//  Services.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

final class Services: IAppServices {
    var authNetworkService: IAuthNetworkService

    required init(authNetworkService: IAuthNetworkService) {
        self.authNetworkService = authNetworkService
    }

    class func buildServices() -> Services {
        let authNetworkService = AuthNetworkService()

        return Services(authNetworkService: authNetworkService)
    }
}

