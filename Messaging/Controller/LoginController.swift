//
//  ViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
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
            AuthService.createUser(viewController: self, withEmail: email, password: password, displayName: displayName)
        default:
            //Login Submit Button
            AuthService.login(viewController: self, withEmail: email, password: password)
        }
    }
}

