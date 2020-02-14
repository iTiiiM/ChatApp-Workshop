//
//  ChatViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var channel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = channel
        tableView.separatorStyle = .none
        addChatListener()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAllChats()
    }
    
    func addChatListener() {
        // Add listener to documents to update chat sort by timeStamp
       
    }
    
    func loadAllChats() {
        
    }
    
    @IBAction func sendButtonDidTapped(_ sender: Any) {
     
    }
}

extension ChatViewController: UITableViewDelegate {
    
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
