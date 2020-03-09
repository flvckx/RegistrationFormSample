//
//  UIVIewController+.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 09/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

extension UIViewController {

    func setCorneredNavigationBar() {
        navigationController?.navigationBar.layer.cornerRadius = 10
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        setStatusBarColor(R.color.baseGreen())
    }
}
