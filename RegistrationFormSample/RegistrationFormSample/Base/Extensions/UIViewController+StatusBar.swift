//
//  UIViewController+StatusBar.swift
//  RegistrationFormSample
//
//  Created by Serhii Palash on 08/03/2020.
//  Copyright © 2020 Serhii Palash. All rights reserved.
//

import UIKit

extension UIViewController {

    func setStatusBarColor(_ color: UIColor?) {
        if #available(iOS 13.0, *) {
            guard let navView = navigationController?.view else { return }

            let statusBarHeight: CGFloat = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0

            let statusbarView = UIView()
            statusbarView.backgroundColor = R.color.baseGreen()
            navView.addSubview(statusbarView)

            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: navView.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: navView.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: navView.centerXAnchor).isActive = true

        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = R.color.baseGreen()
        }
    }
}
