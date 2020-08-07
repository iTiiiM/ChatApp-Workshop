//
//  UIViewController+Messaging.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 7/8/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
