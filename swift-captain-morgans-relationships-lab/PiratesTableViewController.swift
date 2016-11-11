//
//  PiratesTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Benjamin Su on 11/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PiratesTableViewController: UITableViewController {

    let store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
        
        if store.pirates.isEmpty {
            store.generateTestData()
        }
       print(store.pirates.count)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.pirates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pirateCell", for: indexPath)
        
        let pirate = store.pirates[indexPath.row]
        
        cell.textLabel?.text = pirate.name
        cell.detailTextLabel?.text = String((pirate.ships?.allObjects.count)!)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ShipsTableViewController,
            let index = tableView.indexPathForSelectedRow {
            
            dest.ships = store.pirates[index.row].ships?.allObjects as! [Ship]
            
        }
    }
    
    
    
}
