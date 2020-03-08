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

    // MARK: - Flow coordinator variables

    var currentFlow: FlowConfigurations = .auth

    enum FlowConfigurations: ICoordinatorConfiguration {
        case auth

        var factory: ICoordinatorFactory {
            switch self {
            case .auth:
                return OnboardingCoordinatorFactory()
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
//        loadAuthorization()
        changeFlow(currentFlow, finishCallBack: handleFlowCallback(_:))
    }

    private func handleFlowCallback(_ flow: FlowConfigurations) {
        // Change flow logic
    }

    private func changeFlow(_ flow: FlowConfigurations, finishCallBack: @escaping (FlowConfigurations) -> Void) {
        setupNavigationBar(for: flow)

        let factory = flow.factory
        var coordinator = factory.create(router: router, services: services)
        coordinator.finishFlow = { _ in
            finishCallBack(flow)
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
        }
    }
}
