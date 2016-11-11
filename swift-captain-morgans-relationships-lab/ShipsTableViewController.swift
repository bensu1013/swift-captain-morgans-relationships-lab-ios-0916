//
//  ShipsTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Benjamin Su on 11/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ShipsTableViewController: UITableViewController {

    var ships = [Ship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ships.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shipCell", for: indexPath)
        
        let ship = ships[indexPath.row]
        
        cell.textLabel?.text = ship.name
        cell.detailTextLabel?.text = ship.pirate?.name
        
        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ShipDetailViewController,
            let index = tableView.indexPathForSelectedRow {
            
            dest.ship = ships[index.row]
            
        }
    }
    
    
    
    

}




