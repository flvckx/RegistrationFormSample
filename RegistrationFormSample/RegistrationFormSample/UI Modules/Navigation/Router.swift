//
//  Router.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class Router: NSObject, Routable {

    func present(_ module: Routable) {
        self.present(module, animated: true)
    }

    fileprivate weak var rootController: UINavigationController?
    
    private var presentedNavigationController: UINavigationController?

    var toPresent: UIViewController? {
        if presentedNavigationController != nil {
            return presentedNavigationController
        }
        
        return rootController
    }

    // MARK: Initialization
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        self.rootController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: Routable

    func present(_ module: Presentable, animated: Bool) {
        guard let controller = module.toPresent else { return }
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.present(controller, animated: animated, completion: nil)
        }
    }

    func presentOnPresented(_ module: Presentable, animated: Bool) {
        guard let controller = module.toPresent else { return }
        DispatchQueue.main.async { [weak self] in
            self?.presentedNavigationController?.present(controller, animated: animated, completion: nil)
        }
    }

    func presentModuleWithNavigation(_ module: Presentable, animated: Bool) {
        guard let controller = module.toPresent else { return }
        presentedNavigationController = UINavigationController(rootViewController: controller)
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let navigation = self.presentedNavigationController else { return }
            navigation.modalPresentationStyle = .fullScreen
            self.rootController?.present(navigation, animated: animated, completion: nil)
        }
    }

    func pushOnPresented(_ module: Presentable, animated _: Bool) {
        guard
            let controller = module.toPresent,
            !(controller is UINavigationController)
        else { assertionFailure("⚠️Deprecated push UINavigationController."); return }
        DispatchQueue.main.async { [weak self] in
            self?.presentedNavigationController?.pushViewController(controller, animated: true)
        }
    }

    func push(_ module: Presentable, animated: Bool) {
        guard
            let controller = module.toPresent,
            !(controller is UINavigationController)
        else { assertionFailure("⚠️Deprecated push UINavigationController."); return }
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.pushViewController(controller, animated: animated)
        }
    }

    func popModule(animated: Bool) {
        rootController?.popViewController(animated: animated)
    }

    func popModuleToAnother(module: Presentable) {
        guard let controller = module.toPresent else { return }
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.popToViewController(controller, animated: true)
        }
    }

    func popPresented(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.presentedNavigationController?.popViewController(animated: animated)
        }
    }

    func dismissModule(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            if self?.rootController?.topViewController == self?.presentedNavigationController {
                self?.presentedNavigationController = nil
                self?.rootController?.dismiss(animated: animated, completion: nil)
            } else {
                self?.presentedNavigationController?.dismiss(animated: true, completion: nil)
            }
        }
    }

    func dismissPresentedModule(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.presentedNavigationController = nil
            self?.rootController?.dismiss(animated: animated, completion: nil)
        }
    }

    func setRootModule(_ module: Presentable) {
        setRootModule(module, hideBar: false)
    }

    func setRootModule(_ module: Presentable, hideBar: Bool) {
        guard let controller = module.toPresent else { return }
        presentedNavigationController = nil
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.setViewControllers([controller], animated: false)
            self?.rootController?.isNavigationBarHidden = hideBar
        }
    }

    func setupNavigationBar(with modules: [Presentable]) {
        let controllers = modules.compactMap { module -> UIViewController? in
            module.toPresent
        }
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.setViewControllers(controllers, animated: false)
        }
    }

    func setupNavigationBar(with modules: [Presentable], hideBar: Bool) {
        let controllers = modules.compactMap { module -> UIViewController? in
            module.toPresent
        }
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.setViewControllers(controllers, animated: false)
            self?.rootController?.isNavigationBarHidden = hideBar
        }
    }

    func popToRootModule(animated _: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.rootController?.popToRootViewController(animated: true)
        }
    }
}

