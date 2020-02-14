//
//  Extension.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 14/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
