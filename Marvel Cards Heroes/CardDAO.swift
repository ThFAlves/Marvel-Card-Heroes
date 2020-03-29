//
//  CardsDAO.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation
import CoreData

class CardDAO{
    
    static func findAll() -> [Card]
    {
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Card")
        
        // perform search
        do {
            return try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [Card]
        } catch {
            return []
        }
    }
    
    static func findByName(name: String) -> [Card]
    {
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Card")
        
        // assign predicate
        request.predicate = NSPredicate(format: "name == %@", name)
        
        // perform search
        do {
            return try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [Card]
        } catch {
            return []
        }
    }
    
    
    static func insert(objectToBeInserted:Card)
    {
        // insert element into context
        DatabaseManager.sharedInstance.managedObjectContext?.insert(objectToBeInserted)
        
        // save context
        do {
           try DatabaseManager.sharedInstance.managedObjectContext?.save()
          } catch {
           print("Failed saving")
        }
    }
    
}
