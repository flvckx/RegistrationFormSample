//
//  OnboardingViewModel.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol IOnboardingViewModel: OnboardingViewModelOutput {
    var cities: [String] { get }
}

protocol OnboardingViewModelOutput {
    var onNextTouch: (() -> Void)? { get set }
}

final class OnboardingViewModel: IOnboardingViewModel {
    
    private let citiesNetworkService: ICitiesNetworkService
    
    var cities: [String] = ["fsda", "a", "asdas", "asda", "asdasda"]
    var onNextTouch: (() -> Void)?
    
    init(citiesNetworkService: ICitiesNetworkService) {
        self.citiesNetworkService = citiesNetworkService
    }
}
