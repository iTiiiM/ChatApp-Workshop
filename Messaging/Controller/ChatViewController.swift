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
    
    let db = Firestore.firestore()
    var messageCollection: [QueryDocumentSnapshot] = []
//    var messages: [Message] = []

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var channel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = channel
        tableView.register(UINib(nibName: "MyMessageCell", bundle: nil), forCellReuseIdentifier: "myMessageCell")
        tableView.register(UINib(nibName: "OtherMessageCell", bundle: nil), forCellReuseIdentifier: "otherMessageCell")
        tableView.separatorStyle = .none
        addChatListener()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAllChats()
    }
    
    func addChatListener() {
        db.collection("channels").document(channel ?? "").collection("messages").addSnapshotListener { (snapShot, error) in
            guard let documents = snapShot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self.messageCollection = documents
            self.tableView.reloadData()
        }
    }
    
    func loadAllChats() {
        db.collection("channels").document(channel ?? "").collection("messages").getDocuments { (snapShot, error) in
            guard let documents = snapShot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self.messageCollection = documents
            self.tableView.reloadData()
        }
    }
    
    @IBAction func sendButtonDidTapped(_ sender: Any) {
        db.collection("channels").document(channel ?? "").collection("messages").addDocument(data: ["senderId": Auth.auth().currentUser?.uid, "messageBody": messageTextField.text!])
        
    }
    
}

extension ChatViewController: UITableViewDelegate {
    
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let senderName = messageCollection[indexPath.row].data()["senderId"] as? String
        let message = messageCollection[indexPath.row].data()["messageBody"] as? String
        
        if senderName != Auth.auth().currentUser?.uid {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherMessageCell") as! OtherMessageCell
            cell.selectionStyle = .none
            cell.configCell(name: senderName ?? "", message: message ?? "")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myMessageCell") as! MyMessageCell
            cell.selectionStyle = .none
            cell.configCell(name: senderName ?? "", message: message ?? "")
            return cell
        }
    }
}
