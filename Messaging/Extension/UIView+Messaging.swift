//
//  UIViewController+Messaging.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 7/8/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func hideKeyboardWhenTappedAround() {
          let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIView.dismissKeyboard))
          tap.cancelsTouchesInView = false
          self.addGestureRecognizer(tap)
      }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
