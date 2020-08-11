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
    
    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("AddRoomPopupView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        hideKeyboardWhenTappedAround()
    }

    @IBOutlet weak var roomNameErrorLabel: UILabel!
    @IBOutlet weak var roomNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var descriptionErrorLabel: UILabel!
    
    let db = Firestore.firestore()
    
    func toggleErrorLabel() {
        roomNameErrorLabel.isHidden = !roomNameTextField.text!.isEmpty
        descriptionErrorLabel.isHidden = !descriptionTextField.text!.isEmpty
    }
    
    func validateAddRoomInput() -> Bool{
        return !roomNameTextField.text!.isEmpty && !descriptionTextField.text!.isEmpty
    }

    @IBAction func didTapAddRoomButton(_ sender: UIButton) {
        toggleErrorLabel()
        if validateAddRoomInput() {
            db.collection("channels").document(roomNameTextField.text!).setData(["name": roomNameTextField.text, "description": descriptionTextField.text])
            self.removeFromSuperview()
        }
    }
}
