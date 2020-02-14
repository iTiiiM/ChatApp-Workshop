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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func addChannelListener() {
        //Update rooms when new room is added
        
    }
    
    func loadAllRooms() {
        //Load rooms when page appeared
    }
}

extension AllRoomsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Numbers of rows to show on UITableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UI to show on each cell
        return UITableViewCell()
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Tapped on cell
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Set value on next page
        
    }
}

extension AllRoomsViewController: UITableViewDelegate {
    
}
