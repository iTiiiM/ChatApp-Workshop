//
//  OtherMessageCell.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit

class OtherMessageCell: UITableViewCell {

    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
   
    func configCell(name: String, message: String) {
        senderNameLabel.text = name
        messageLabel.text = message
    }
    
}
