//
//  Services.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

final class Services: IAppServices {
    var citiesNetworkService: ICitiesNetworkService

    required init(citiesNetworkService: ICitiesNetworkService) {
        self.citiesNetworkService = citiesNetworkService
    }

    class func buildServices() -> Services {
        let citiesNetworkService = CitiesNetworkService()

        return Services(citiesNetworkService: citiesNetworkService)
    }
}
