//
//  OnboardingView.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class OnboardingView: UIViewController {
    
    @IBOutlet private var nameTextFieldView: UnderlinedTextField!
    @IBOutlet private var surnameTextFieldView: UnderlinedTextField!
    @IBOutlet private var emailTextFieldView: UnderlinedTextField!
    @IBOutlet private var phoneTextFieldView: UnderlinedTextField!
    @IBOutlet private var selectionView: SelectionView!
    @IBOutlet private var passwordTextField: SecureTextField!
    @IBOutlet private var confirmPasswordTextField: SecureTextField!
    
    var viewModel: IOnboardingViewModel!
    
    override func loadView() {
        super.loadView()
        setUpView()
    }
    
    func selectCity(at row: Int) {
        selectionView.textValue = viewModel.cities[row].title
    }
}

// MARK: - UIPickerViewDatasource

extension OnboardingView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.cities.count
    }
}

// MARK: - UIPickerViewDelegate

extension OnboardingView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.cities[row].title
    }
}

// MARK: - Private methods

private extension OnboardingView {
    
    func setUpView() {
        title = R.string.localizible.registration()
        
        navigationController?.navigationBar.layer.cornerRadius = 10
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        nameTextFieldView.placeholder = R.string.localizible.enterName()
        surnameTextFieldView.placeholder = R.string.localizible.enterSurname()
        emailTextFieldView.placeholder = R.string.localizible.email()
        phoneTextFieldView.placeholder = R.string.localizible.phone()
        passwordTextField.placeholder = R.string.localizible.createPassword()
        confirmPasswordTextField.placeholder = R.string.localizible.repeatPassword()
        
        selectionView.textValue = R.string.localizible.chooseCity()
        selectionView.onSelectAction = viewModel.selectionAction
    }
}
