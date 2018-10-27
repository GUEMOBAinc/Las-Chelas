//
//  HistorialController.swift
//  Las Chelas
//
//  Created by Brian Morales on 26/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class HistorialController: UITableViewController {
    
    var userHistory = [
        "Indio",
        "Tempus",
        "XX",
        "Tecate",
        "Corona",
        "Bohemia",
        "Carta Blanca",
        "Noche Buena",
        "Sol"
    ]
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    

}


extension HistorialController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userHistory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historicoCell", for: indexPath)
        cell.textLabel?.text = userHistory[indexPath.row]
        return cell
        
    }
    
    
}









