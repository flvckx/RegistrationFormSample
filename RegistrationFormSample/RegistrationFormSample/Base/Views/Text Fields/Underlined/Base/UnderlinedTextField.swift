//
//  TextField.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import SwiftPhoneNumberFormatter
import UIKit

class UnderlinedTextField: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var underlineView: UIView! {
        didSet {
            underlineView.backgroundColor = R.color.lightGray()
        }
    }
    
    var text: String? {
        return textField.text
    }
    
    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    var isSecureEntry: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecureEntry
        }
    }
    
    var content: TextFieldContent?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        initView()
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed(R.nib.underlinedTextField.name, owner: self, options: nil)
    }
    
    private func initView() {
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

// MARK: - UITextFieldDelegate

extension UnderlinedTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        switch content {
        case .name, .surname:
            let allowedCharacters = CharacterSet.letters
            let characters = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characters)
        default:
            return true
        }
    }
}
