//
//  PhoneTextField.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import SwiftPhoneNumberFormatter
import UIKit

class PhoneTextField: UIView, TextContainable {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private var phoneTextField: PhoneFormattedTextField! {
        didSet {
            phoneTextField.config.defaultConfiguration = PhoneFormat(phoneFormat: "(##)###-##-##", regexp: "\\d*$")
            phoneTextField.prefix = "+380"
        }
    }

    @IBOutlet private var underlineView: UIView! {
        didSet {
            underlineView.backgroundColor = R.color.lightGray()
        }
    }

    var text: String? {
        return phoneTextField.text
    }

    var placeholder: String? {
        didSet {
            phoneTextField.placeholder = placeholder
        }
    }

    var isValid: Bool = true {
        didSet {
            guard oldValue != isValid else { return }
            underlineView.backgroundColor = isValid ? R.color.lightGray() : .red
        }
    }

    var onTextChangedAction: (() -> Void)?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        initView()
    }

    func loadNib() {
        Bundle.main.loadNibNamed(R.nib.phoneTextField.name, owner: self, options: nil)
    }

    private func initView() {
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        phoneTextField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingDidEnd)
    }

    @objc private func textFieldValueChanged() {
        isValid = text?.count ?? 0 == 17
        onTextChangedAction?()
    }
}
