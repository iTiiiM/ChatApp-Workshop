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
class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    var db: Firestore?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        db = Firestore.firestore()
    }
    
    
    @IBAction func registerButtonDidTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                print(error!)
            } else {
               
                self.db?.collection("users").addDocument(data: ["email": self.emailTextField.text ?? ""])
                let user = Auth.auth().currentUser
                if let user = user {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = self.displayNameTextField.text
                }
                let alert = UIAlertController(title: "Register success", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                print(error!)
            } else {
                self.performSegue(withIdentifier: "toAllRooms", sender: nil)
            }
        }
    }
    
}

