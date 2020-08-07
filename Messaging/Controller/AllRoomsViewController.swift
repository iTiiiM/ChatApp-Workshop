//
//  AllRoomsViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class AllRoomsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let roomCellIdentifier = "roomCell"
    let toChatViewControllerIdentifier = "toChat"
    let db = Firestore.firestore()
    var roomsCollection: [QueryDocumentSnapshot] = []
    var chatRoomName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addChannelListener()
    }
    
    
    @IBAction func didTapAddRoomButton(_ sender: UIButton) {
        let view = AddRoomPopupView()
        self.view.addSubview(view)
    }

    
    func addChannelListener() {
        db.collection("channels").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self.roomsCollection = documents
            self.tableView.reloadData()
        }
    }
}

extension AllRoomsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: roomCellIdentifier) as! RoomCell
        if let roomName = roomsCollection[indexPath.row].data()["name"], let roomDescription = roomsCollection[indexPath.row].data()["description"] {
            cell.selectionStyle = .none
            cell.configCell(name: roomName as! String, description: roomDescription as! String)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension AllRoomsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chatRoomName = roomsCollection[indexPath.row].data()["name"] as? String
        performSegue(withIdentifier: toChatViewControllerIdentifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationViewController = segue.destination as? ChatViewController {
            destionationViewController.channel = chatRoomName
        }
    }
}
