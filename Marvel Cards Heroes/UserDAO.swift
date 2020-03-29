//
//  UserDAO.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation
import CoreData

class UserDAO
{
    
    static func verifMoney(money: NSNumber) -> Bool
    {
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let results: [User] = try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [User]
            if ((results[0].money.intValue - money.intValue) >= 0){
                return true
            }
            return false
        } catch {
            print("Error")
        }
        return false
    }
    
    static func decMoney(money: NSNumber){
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // perform search
        do {
            let results: [User] = try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [User]
            results[0].money = NSNumber(value: results[0].money.intValue - money.intValue)
        } catch {
            print("Error")
        }
                
        do {
           try DatabaseManager.sharedInstance.managedObjectContext?.save()
          } catch {
           print("Failed saving")
        }
    }
    
    static func addMoney(money: NSNumber){
        
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // perform search
        do {
            let results = try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [User]
            results[0].money = NSNumber(value: results[0].money.intValue + money.intValue)
        } catch {
            print("Errrou !!")
        }

        // save context
        do {
           try DatabaseManager.sharedInstance.managedObjectContext?.save()
          } catch {
           print("Failed saving")
        }
    }
    
    static func returnMoney() -> NSNumber
    {
        
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // perform search
        do {
            let users = try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [User]
            return users.first!.money
        } catch {
            return 0
        }
    }
    
    static func findByName(name: String) -> [User]
    {
        // creating fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // assign predicate
        request.predicate = NSPredicate(format: "name == %@", name)
        
        // perform search
        do {
            return try DatabaseManager.sharedInstance.managedObjectContext?.fetch(request) as! [User]
        } catch {
            return []
        }
    }
    
    
    static func insert(objectToBeInserted:User)
    {
        // insert element into context
        DatabaseManager.sharedInstance.managedObjectContext?.insert(objectToBeInserted)
        
        // save context
        do {
            try DatabaseManager.sharedInstance.managedObjectContext?.save()
        } catch {
            print("Error")
        }
    }
    
}
