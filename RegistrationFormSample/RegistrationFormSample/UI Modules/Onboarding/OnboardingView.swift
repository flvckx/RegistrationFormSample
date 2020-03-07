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
        return viewModel.cities[row]
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
        selectionView.onSelectAction = presentSelectionSheet
    }
    
    private func presentSelectionSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        let pickerView = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        alert.view.addSubview(pickerView)
        
        let selectAction = UIAlertAction(
            title: R.string.localizible.apply(),
            style: .default) { [weak self] _ in
                let selectedIndex = pickerView.selectedRow(inComponent: 0)
                self?.selectionView.textValue = self?.viewModel.cities[selectedIndex]
        }
        alert.addAction(selectAction)
        present(alert, animated: true)
    }
}
