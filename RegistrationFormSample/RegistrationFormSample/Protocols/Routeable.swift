//
//  Routeable.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

protocol Routable: Presentable {
    func present(_ module: Presentable, animated: Bool)
    func presentOnPresented(_ module: Presentable, animated: Bool)
    func presentModuleWithNavigation(_ module: Presentable, animated: Bool)
    func pushOnPresented(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool)
    func popModule(animated: Bool)
    func popModuleToAnother(module: Presentable)
    func popPresented(animated: Bool)
    func dismissModule(animated: Bool)
    func dismissPresentedModule(animated: Bool)
    func setRootModule(_ module: Presentable)
    func setupNavigationBar(with modules: [Presentable])
    func popToRootModule(animated: Bool)

    func present(_ module: Routable)
}
