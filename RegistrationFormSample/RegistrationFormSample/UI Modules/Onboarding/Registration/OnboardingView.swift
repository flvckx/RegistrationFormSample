//
//  OnboardingView.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

final class OnboardingView: KeyboardSupportController {

    @IBOutlet private var nameTextFieldView: UnderlinedTextField!
    @IBOutlet private var surnameTextFieldView: UnderlinedTextField!
    @IBOutlet private var emailTextFieldView: UnderlinedTextField!
    @IBOutlet private var phoneTextFieldView: PhoneTextField!
    @IBOutlet private var selectionView: SelectionView!
    @IBOutlet private var passwordTextField: SecureTextField!
    @IBOutlet private var confirmPasswordTextField: SecureTextField!
    @IBOutlet private var termsAndCoLabel: UILabel!
    @IBOutlet private var nextButton: UIButton!

    var textFields: [TextContainable] {
        return [
            nameTextFieldView, surnameTextFieldView,
            emailTextFieldView, phoneTextFieldView,
            passwordTextField, confirmPasswordTextField
        ]
    }

    var viewModel: IOnboardingViewModel!

    override func loadView() {
        super.loadView()
        setUpView()
    }

    func selectCity(at row: Int) {
        selectionView.textValue = viewModel.cities[row].title
    }

    func validateForm() {
        textFields.forEach {
            guard $0.isValid else {
                setNextButton(false)
                return
            }
        }

        guard !(passwordTextField.text?.isEmpty ?? true),
            passwordTextField.text == confirmPasswordTextField.text else {
                setNextButton(false)
                return
        }

        setNextButton(true)
    }

    func setNextButton(_ active: Bool) {
        nextButton.backgroundColor = active ? R.color.baseGreen() : R.color.lightGray()
        nextButton.isUserInteractionEnabled = active
    }

    @IBAction private func nextButtonTouched(_ sender: Any) {
        let user = User(
            name: nameTextFieldView.text ?? "",
            surname: surnameTextFieldView.text ?? "",
            email: emailTextFieldView.text ?? "",
            phone: phoneTextFieldView.text ?? "",
            city: selectionView.textValue ?? ""
        )
        viewModel.onNextTouch?(user)
    }
}

// MARK: - UITableViewDataSource

extension OnboardingView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.cities[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate

extension OnboardingView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCity(at: indexPath.row)
        viewModel.onSelectCity?()
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
        setUpNavBar()
        setUpTextFields()

        termsAndCoLabel.numberOfLines = 0
        termsAndCoLabel.text = R.string.localizible.acceptingTermsAndCo()

        nextButton.backgroundColor = R.color.lightGray()
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        nextButton.setTitle(R.string.localizible.next(), for: .normal)
        nextButton.isUserInteractionEnabled = false
    }

    func setUpNavBar() {
        title = R.string.localizible.registration()
        setCorneredNavigationBar()
    }

    func setUpTextFields() {
        nameTextFieldView.content = .name
        nameTextFieldView.placeholder = R.string.localizible.enterName()

        surnameTextFieldView.content = .surname
        surnameTextFieldView.placeholder = R.string.localizible.enterSurname()

        emailTextFieldView.content = .email
        emailTextFieldView.placeholder = R.string.localizible.email()

        phoneTextFieldView.placeholder = R.string.localizible.phone()

        passwordTextField.content = .password
        passwordTextField.placeholder = R.string.localizible.createPassword()

        confirmPasswordTextField.content = .password
        confirmPasswordTextField.placeholder = R.string.localizible.repeatPassword()

        selectionView.textValue = R.string.localizible.chooseCity()
        selectionView.onSelectAction = viewModel.selectionAction

        for var textField in textFields {
            textField.onTextChangedAction = validateForm
        }
    }
}
