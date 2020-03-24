//
//  ViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import Firebase
import PopupDialog

class AuthenticationViewController: UIViewController {
    
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var displayNameStackView: UIStackView!
    var db: Firestore?
    
    enum SegmentedIndex: Int {
        case register = 0
        case login = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case SegmentedIndex.register.rawValue:
            displayNameStackView.isHidden = false
        case SegmentedIndex.login.rawValue:
            displayNameStackView.isHidden = true
        default: break
        }
    }
    
    @IBAction func submitButtonDidTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text, let displayName = displayNameTextField.text else { return }
        
        switch segmentedControl.selectedSegmentIndex {
        case SegmentedIndex.register.rawValue:
            //Register Submit Button
            if password == confirmPassword {
                AuthService.createUser(withEmail: email, password: password, displayName: displayName) { (registerResult) in
                    switch registerResult {
                    case .error:
                        let popup = PopupDialog(.registerFailed)
                        self.present(popup, animated: true, completion: nil)
                    case .success:
                        let popup = PopupDialog(.registerSuccess)
                        self.present(popup, animated: true, completion: nil)
                    }
                }
            } else {
                let popup = PopupDialog(.registerFailedPasswordInvalid)
                self.present(popup, animated: true, completion: nil)
            }
        case SegmentedIndex.login.rawValue:
            //Login Submit Button
            AuthService.login(withEmail: email, password: password) { (loginResult) in
                switch loginResult {
                case .error:
                    let popup = PopupDialog(.loginError)
                    self.present(popup, animated: true, completion: nil)
                case .success:
                    self.performSegue(withIdentifier: "toAllRooms", sender: nil)
                }
            }
        default: break
        }
    }
}
