//
//  SelectionView.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 07/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

class SelectionView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var selectionImageView: UIImageView! {
        didSet {
            selectionImageView.image = R.image.selectListIcon()
        }
    }

    @IBOutlet private var underlineView: UIView! {
        didSet {
            underlineView.backgroundColor = R.color.lightGray()
        }
    }

    var onSelectAction: (() -> Void)?
    var textValue: String? {
        didSet {
            valueLabel.text = textValue
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        initView()
    }

    func loadView() {
        Bundle.main.loadNibNamed(R.nib.selectionView.name, owner: self, options: nil)
    }

    private func initView() {
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    @IBAction private func selectAction(_ sender: Any) {
        onSelectAction?()
    }
}
