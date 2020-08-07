//
//  AddRoomPopupView.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 24/3/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AddRoomPopupView: UIView {

    @IBOutlet weak var roomNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let db = Firestore.firestore()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func didTapAddRoomButton(_ sender: UIButton) {
        db.collection("channels").document(roomNameTextField.text!).setData(["name": roomNameTextField.text, "description": descriptionTextField.text])
//        self.navigationController?.popViewController(animated: true)
    }
    
}
