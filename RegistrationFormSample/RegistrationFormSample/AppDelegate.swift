//
//  AppDelegate.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

        let services = Services.buildServices()

        coordinator = AppCoordinator(window: window!, services: services)
        coordinator.start()

        window?.makeKeyAndVisible()

        UINavigationBar.appearance().backIndicatorImage = R.image.backButton()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = R.image.backButton()

        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)

        UINavigationBar.appearance().tintColor = .white

        return true
    }
}
