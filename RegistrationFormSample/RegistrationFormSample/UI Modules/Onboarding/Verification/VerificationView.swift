//
//  VerificationView.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

class VerificationView: KeyboardSupportController {

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var bioTextView: BorderedTextView!
    @IBOutlet private var separatorView: UIView!

    @IBOutlet private var imageViewSublabel: UILabel!
    @IBOutlet private var textViewTitleLabel: UILabel!

    @IBOutlet private var skipButton: UIButton!
    @IBOutlet private var saveButton: UIButton!

    var viewModel: IVerificationViewModel!

    override func loadView() {
        super.loadView()
        setUpView()
    }
}

// MARK: - UITextViewDelegate

extension VerificationView: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if let textView = textView as? BorderedTextView,
            textView.text.isEmpty {
            textView.placeholder = R.string.localizible.enterTextLessThan(Constants.bioMaxLength)
        }
    }
}

// MARK: - ImagePickerDelegate

extension VerificationView: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        profileImageView.image = image ?? R.image.profilePhotoPlaceholder()
    }
}

// MARK: - Private

private extension VerificationView {

    func setUpView() {
        title = R.string.localizible.verification()

        setProfileImageView()
        setUpTextView()
        separatorView.backgroundColor = R.color.darkGray()

        imageViewSublabel.text = R.string.localizible.chooseYourProfilePhoto()
        textViewTitleLabel.text = R.string.localizible.tellAboutYourself()
    }

    func setProfileImageView() {
        profileImageView.image = R.image.profilePhotoPlaceholder()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loadPhoto))
        profileImageView.addGestureRecognizer(tapGesture)

        profileImageView.isUserInteractionEnabled = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }

    func setUpTextView() {
        bioTextView.placeholder = R.string.localizible.enterTextLessThan(Constants.bioMaxLength)
    }

    @objc func loadPhoto() {
        viewModel.openPicker(source: profileImageView)
    }
}
