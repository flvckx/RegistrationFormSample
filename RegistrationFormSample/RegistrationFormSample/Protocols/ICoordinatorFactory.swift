//
//  ICoordinatorFactory.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

protocol ICoordinatorFactory {
    func create(router: Routable,
                services: IAppServices) -> Coordinatable & CoordinatorFinishable
}
