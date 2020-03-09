//
//  BorderedTextView.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

class BorderedTextView: UITextView {

    var placeholder: String? {
        didSet {
            setUpPlaceholder()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setBorder()
    }

    func setBorder() {
        layer.borderWidth = 1
        layer.borderColor = R.color.darkGray()?.cgColor
    }

    private func setUpPlaceholder() {
        text = placeholder
        textColor = R.color.lightGray()
    }
}
