//
//  OnboardingCoordinator.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: Coordinatable & CoordinatorFinishable {

    private let router: Routable
    private let applicationServices: IAppServices

    private let signupSceneFactory: SignupSceneFactory

    var finishFlow: ((Any?) -> Void)?

    init(router: Routable, applicationServices: IAppServices) {
        self.router = router
        self.applicationServices = applicationServices

        self.signupSceneFactory = SignupSceneFactory()
    }

    func start() {
        var scene = signupSceneFactory.scene(services: applicationServices)

        scene.viewModel.selectionAction = {
            self.presentSelectionModeAlert(on: scene.view)
        }

        scene.viewModel.onNextTouch = {

        }

        router.setRootModule(scene.view)
    }

    private func presentSelectionModeAlert(on view: Presentable) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let tableAction = UIAlertAction(title: UITableView.description(), style: .default, handler: { _ in })
        let pickerAction = UIAlertAction(
            title: UIPickerView.description(),
            style: .default,
            handler: { [weak self] _ in self?.presentActionSheetWithPicker(on: view) }
        )

        alert.addAction(tableAction)
        alert.addAction(pickerAction)

        view.toPresent?.present(alert, animated: true)
    }

    private func presentActionSheetWithPicker(on view: Presentable) {
        guard let viewController = view.toPresent as? OnboardingView else { return }

        let alert = UIAlertController(title: "", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)

        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: viewController.view.frame.width - 20, height: 150))
        pickerView.dataSource = viewController
        pickerView.delegate = viewController

        alert.view.addSubview(pickerView)

        let selectAction = UIAlertAction(
            title: R.string.localizible.apply(),
            style: .cancel,
            handler: { _ in viewController.selectCity(at: pickerView.selectedRow(inComponent: 0)) }
        )
        alert.addAction(selectAction)

        viewController.present(alert, animated: true)
    }
}
