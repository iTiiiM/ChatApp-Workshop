//
//  AuthServicee.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/3/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import PopupDialog

public class AuthService {
    
    public static func createUser(viewController: UIViewController, withEmail email: String, password: String, displayName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                let popup = PopupDialog(title: "Register failed", message: "* Email already in use \n * Password must be longer than 6 characters")
                viewController.present(popup, animated: true, completion: nil)
            } else {
                let user = Auth.auth().currentUser
                if let user = user {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = displayName
                    changeRequest.commitChanges(completion: { (error) in
                        if error != nil {
                            print(error!)
                        }
                    })
                }
                let popup = PopupDialog(title: "Register success", message: "")
                viewController.present(popup, animated: true, completion: nil)
            }
        }
    }
    
    public static func login(viewController: UIViewController, withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                let popup = PopupDialog(title: "Login failed", message: "* Email is not in use \n * Password is incorrect")
                viewController.present(popup, animated: true, completion: nil)
            } else {
                viewController.performSegue(withIdentifier: "toAllRooms", sender: nil)
            }
        }
    }
}
