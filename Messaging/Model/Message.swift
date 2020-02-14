//
//  Message.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 14/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import Foundation

struct Message {
    var senderName: String
    var messageBody: String
    
    init(name: String, message: String) {
        senderName = name
        messageBody = message
    }

}
