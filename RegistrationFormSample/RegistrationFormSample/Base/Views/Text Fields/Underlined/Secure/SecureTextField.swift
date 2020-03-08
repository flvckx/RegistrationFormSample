//
//  SecureTextField.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

class SecureTextField: UnderlinedTextField {

    @IBOutlet private var secureEntryButton: UIButton! {
        didSet {
            secureEntryButton.setBackgroundImage(R.image.eyeIcon(), for: .normal)
            secureEntryButton.addTarget(self, action: #selector(secureEntryButtonTouched), for: .touchUpInside)
        }
    }

    override func loadNib() {
        Bundle.main.loadNibNamed(R.nib.secureTextField.name, owner: self, options: nil)
        isSecureEntry = true
    }

    @objc private func secureEntryButtonTouched() {
        isSecureEntry = !isSecureEntry
    }
}
