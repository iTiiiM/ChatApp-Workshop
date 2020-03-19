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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var displayNameStackView: UIStackView!
    var db: Firestore?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            displayNameStackView.isHidden = false
        default:
            displayNameStackView.isHidden = true
        }
    }
    
    @IBAction func submitButtonDidTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text, let displayName = displayNameTextField.text else { return }
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            //Register Submit Button
            AuthService.createUser(viewController: self, withEmail: email, password: password, displayName: displayName) { (registerResult) in
                switch registerResult {
                case .error:
                    let popup = PopupDialog(.registerFailed)
                    self.present(popup, animated: true, completion: nil)
                case .success:
                    let popup = PopupDialog(.registerSuccess)
                    self.present(popup, animated: true, completion: nil)
                }
            }
            
        default:
            //Login Submit Button
            AuthService.login(viewController: self, withEmail: email, password: password) { (loginResult) in
                switch loginResult {
                case .error:
                    let popup = PopupDialog(.loginError)
                    self.present(popup, animated: true, completion: nil)
                case .success:
                    self.performSegue(withIdentifier: "toAllRooms", sender: nil)
                }
            }
        }
    }
}

