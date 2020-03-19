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
    
    public enum AuthResult {
        case success
        case error
    }
    
    public static func createUser(withEmail email: String, password: String, displayName: String, completion: @escaping(_ authResult: AuthResult) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                completion(.error)
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
                completion(.success)
            }
        }
    }
    
    public static func login(withEmail email: String, password: String, completion: @escaping(_ authResult: AuthResult) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                completion(.error)
            } else {
                completion(.success)
            }
        }
    }
}
