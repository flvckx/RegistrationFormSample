//
//  KeyboardSupportViewController.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

class KeyboardSupportController: UIViewController {
    // MARK: Lifecycle

    var tapGesture: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(onView(_:)))
        tapGesture.cancelsTouchesInView = false

        view.addGestureRecognizer(tapGesture)
    }

    @objc func onView(_: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    deinit {
        view.removeGestureRecognizer(tapGesture)
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: Keyboard handlers

    @objc private func keyboardWillShow(notification: Notification) {
        let height = keyboardHeightFromNotification(notification)
        willShowKeyboardWithHeight(height)
    }

    @objc private func keyboardWillHide(notification: Notification) {
        let height = keyboardHeightFromNotification(notification)
        willHideKeyboardWithHeight(height)
    }

    private func keyboardHeightFromNotification(_ notification: Notification) -> CGFloat {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return 0
        }
        return keyboardFrame.cgRectValue.height
    }

    func willShowKeyboardWithHeight(_: CGFloat) {}

    func willHideKeyboardWithHeight(_: CGFloat) {}
}

