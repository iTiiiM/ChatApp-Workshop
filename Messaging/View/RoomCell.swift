//
//  RoomCell.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configCell(name: String, description: String) {
        roomNameLabel.text = name
        descriptionLabel.text = description
    }

}
