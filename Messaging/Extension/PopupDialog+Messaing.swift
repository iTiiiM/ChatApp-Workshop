//
//  Messaing+PopupDialog.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 20/3/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import Foundation
import PopupDialog

extension PopupDialog {
    // Use extension because it cannot subclass (Final Class)
    // Easier to find bug from popup

    // *** Extension can't have stored property
    // *** Nil is only return type in class initializer
    
    // Could refactor more if have localized string
    enum PopupDialogCases {
        case registerFailed
        case registerSuccess
        case registerFailedPasswordInvalid
        case loginError
    }
    
    convenience init(_ popupDialogCase: PopupDialogCases) {
        switch popupDialogCase {
        case .registerFailed:
            self.init(title: "Register failed", message: "* Password must be longer than 6 characters")
        case .registerSuccess:
            self.init(title: "Register success", message: "")
        case .registerFailedPasswordInvalid:
            self.init(title: "Register failed", message: "* Password and Confirm password doesn't match")
        case .loginError:
            self.init(title: "Login failed", message: "* Email is not in use \n * Password is incorrect")
        }
    }
}
