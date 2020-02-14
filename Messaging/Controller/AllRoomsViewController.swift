//
//  AllRoomsViewController.swift
//  Messaging
//
//  Created by Piyatat  Thianboonsong on 13/2/2563 BE.
//  Copyright © 2563 iTiiiM. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AllRoomsViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var roomsCollection: [QueryDocumentSnapshot] = []
    var roomName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addChannelListener()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
//        loadAllRooms()
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
    
    func loadAllRooms() {
        db.collection("channels").getDocuments { (snapShot, error) in
            self.roomsCollection = snapShot!.documents
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension AllRoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as! RoomCell
         roomName = roomsCollection[indexPath.row].data()["name"] as? String
        let roomDescription = roomsCollection[indexPath.row].data()["description"] as? String

        cell.configCell(name: roomName ?? "", description: roomDescription ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        roomName = roomsCollection[indexPath.row].data()["name"] as? String
        performSegue(withIdentifier: "toChat", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationVC = segue.destination as? ChatViewController {
            destionationVC.channel = roomName
        }
    }
    
}

extension AllRoomsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsCollection.count
    }
}
