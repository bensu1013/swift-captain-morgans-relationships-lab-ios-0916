//
//  DataStore.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Benjamin Su on 11/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData


class DataStore {
    
    var pirates = [Pirate]()
    
    static var sharedInstance = DataStore()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "PirateModel")
        
        container.loadPersistentStores(completionHandler: { (store, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
        
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() {
        
        let context = persistentContainer.viewContext
        let fetchPirate = NSFetchRequest<Pirate>(entityName: "Pirate")
        do {
            pirates = try context.fetch(fetchPirate)
 
        } catch {
            
        }
    }
    

}


//MARK: -Generating TestData


extension DataStore {
    func generateTestData() {
        
        for _ in 1...20 {
          
            let pirate = createPirate()
            for _ in 1...10 {
             
                let ship = createShip()
                pirate.addToShips(ship)
                
                let engine = createEngine()
                ship.engine = engine
            }
        }
        
        saveContext()
        fetchData()
    }
    
    func createPirate() -> Pirate {
        let context = persistentContainer.viewContext
        
        let pirate = Pirate(context: context)
        pirate.name = pirateNames[Int(arc4random_uniform(UInt32(pirateNames.count)))]
        
        return pirate
    }
    
    func createShip() -> Ship {
        let context = persistentContainer.viewContext
        
        let ship = Ship(context: context)
        ship.name = shipNames[Int(arc4random_uniform(UInt32(shipNames.count)))]
        
        return ship
    }
    
    func createEngine() -> Engine {
        let context = persistentContainer.viewContext
        
        let engine = Engine(context: context)
        engine.engineType = engineType[Int(arc4random_uniform(UInt32(engineType.count)))]
        
        return engine
    }
}


let pirateNames = [
    "One-Eyed Jack",
    "Bottoms-Up Toby",
    "Wing-Earred Porter",
    "Swindler Jeb",
    "Pan-Handling Boris",
    "Timid Tim",
    "Glorious John",
    "Black Beard",
    "Gargling Gipper",
    "Taunting Terry",
    "Leary Bear",
    "Cackling Carl",
    "Indecent Jim",
    "Toblerone",
    "Nutella",
    "Swashbuckling Sammy",
    "Tattling Tam"
]

let shipNames = [
    "Oro Jackson",
    "Sea Witch",
    "Black Pearl",
    "Timber",
    "Paradise",
    "Nocturnal",
    "Intrepid",
    "The Kardashian",
    "El Capitan",
    "The Sierra",
    "Bermuda Thai Angle"
]

let engineType = [
    "Sail",
    "Gas",
    "Oars",
    "Nuclear"
]



