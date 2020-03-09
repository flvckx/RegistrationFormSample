//
//  OnboardingViewModel.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol IOnboardingViewModel: OnboardingViewModelOutput {
    var cities: [City] { get }
}

protocol OnboardingViewModelOutput {
    var onNextTouch: ((User) -> Void)? { get set }
    var selectionAction: (() -> Void)? { get set }
    var onSelectCity: (() -> Void)? { get set }
}

final class OnboardingViewModel: IOnboardingViewModel {

    private let citiesNetworkService: ICitiesNetworkService

    var cities: [City] = []

    var selectionAction: (() -> Void)?
    var onNextTouch: ((User) -> Void)?
    var onSelectCity: (() -> Void)?

    init(citiesNetworkService: ICitiesNetworkService) {
        self.citiesNetworkService = citiesNetworkService

        loadCities()
    }

    func loadCities() {
        citiesNetworkService.getCities { [weak self] (cities) in
            self?.cities = cities
        }
    }
}
