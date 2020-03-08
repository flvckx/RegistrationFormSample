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
    @IBOutlet private var bioTextView: UITextView!
    @IBOutlet private var separatorView: UIView!

    @IBOutlet private var imageViewSublabel: UILabel!
    @IBOutlet private var textViewTitleLabel: UILabel!

    @IBOutlet private var skipButton: UIButton!
    @IBOutlet private var saveButton: UIButton!

    var viewModel: IVerificationViewModel!
}
