//
//  IAuthNetworkService.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import Alamofire

private let citiesURL = URL(string: "http://159.89.21.39/api/v1/cities")!

protocol ICitiesNetworkService {
    func getCities(completion: @escaping ([City]) -> Void)
}

final class CitiesNetworkService: ICitiesNetworkService {

    func getCities(completion: @escaping ([City]) -> Void) {
        request(citiesURL).response { (response) in
            guard let data = response.data, response.error == nil else { return }
            do {
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(cities)
            } catch {
                print("Decoding error")
            }
        }
    }
}
