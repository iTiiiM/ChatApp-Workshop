//
//  ViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import PopupDialog

class ViewController: UIViewController {
    
    var db: Firestore?
  
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
            // Register Submit Button Did Tapped
//            showAlert(title: "ERROR", message: "Invalid e-mail \n Password must be longer than 6 characters")
            break
        default:
            // Login Submit Button Did Tapped
            showAlert(title: "You just tapped on login", message: "")
            break
        }
    }
}

