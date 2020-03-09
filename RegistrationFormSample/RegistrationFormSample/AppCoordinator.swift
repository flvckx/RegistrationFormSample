//
//  AppCoordinator.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinatable {
    // MARK: - Properties

    private let window: UIWindow
    private var router: Router
    private var services: IAppServices
    private var user: User?

    // MARK: - Flow coordinator variables

    var currentFlow: FlowConfigurations = .auth

    enum FlowConfigurations: ICoordinatorConfiguration {
        case auth, profile

        var factory: ICoordinatorFactory {
            switch self {
            case .auth:
                return OnboardingCoordinatorFactory()
            case .profile:
                return ProfileCoordinatorFactory()
            }
        }
    }

    // MARK: - init

    required init(window: UIWindow, services: IAppServices) {
        self.window = window

        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        router = Router(rootController: navigationController)

        self.services = services
    }

    func start() {
        changeFlow(currentFlow, finishCallBack: handleFlowCallback(_:))
    }

    private func handleFlowCallback(_ flow: FlowConfigurations) {
        switch flow {
        case .auth:
            changeFlow(.profile, finishCallBack: handleFlowCallback(_:))
        case .profile:
            break
        }
    }

    private func changeFlow(_ flow: FlowConfigurations, finishCallBack: @escaping (FlowConfigurations) -> Void) {
        setupNavigationBar(for: flow)

        let factory = flow.factory
        var coordinator = factory.create(router: router, services: services)
        coordinator.finishFlow = { some in
            if let user = some as? User {
                self.user = user
            }

            finishCallBack(flow)
        }

        if let coordinator = coordinator as? ProfileCoordinator {
            coordinator.user = user
        }

        DispatchQueue.main.async {
            coordinator.start()
            self.window.makeKeyAndVisible()
        }

        currentFlow = flow
    }

    private func setupNavigationBar(for flow: FlowConfigurations) {
        switch flow {
        case .auth:
            let navigationAppereance = UINavigationBar.appearance()
            navigationAppereance.barTintColor = R.color.baseGreen()
            navigationAppereance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationAppereance.isTranslucent = false
        case .profile:
            break
        }
    }
}
