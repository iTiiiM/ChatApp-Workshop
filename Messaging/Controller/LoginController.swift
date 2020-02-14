//
//  ViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Firebase
import PopupDialog
class ViewController: UIViewController {
    
    var db: Firestore?
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var displayNameStackView: UIStackView!
  
    
    
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
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil {
                    print(error!)
                } else {
                    let user = Auth.auth().currentUser
                    if let user = user {
                        let changeRequest = user.createProfileChangeRequest()
                        changeRequest.displayName = self.displayNameTextField.text
                        changeRequest.commitChanges(completion: { (error) in
                            if error != nil {
                                print(error!)
                            } else {
                                //                            self.db?.collection("users").addDocument(data: ["email": self.emailTextField.text ?? "", "displayName": self.displayNameTextField.text])
                            }
                        })
                    }
                    let popup = PopupDialog(title: "Register success", message: "")
                    self.present(popup, animated: true, completion: nil)
//                    let alert = UIAlertController(title: "Register success", message: "", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default))
//                    self.present(alert, animated: true, completion: nil)
                }
            }
        default:
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil {
                    print(error!)
                } else {
                    self.performSegue(withIdentifier: "toAllRooms", sender: nil)
                }
            }
        }
    }
    
    @IBAction func registerButtonDidTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func loginButtonDidTapped(_ sender: Any) {
    
    }
    
}

