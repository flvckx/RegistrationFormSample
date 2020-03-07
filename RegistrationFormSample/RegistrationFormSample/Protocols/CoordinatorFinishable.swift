//
//  CoordinatorFinishable.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol CoordinatorFinishable {
    var finishFlow: ((Any?) -> Void)? { get set }
}
