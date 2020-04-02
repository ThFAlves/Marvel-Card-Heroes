//
//  User.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {
    
    @NSManaged var level: NSNumber
    @NSManaged var loss: NSNumber
    @NSManaged var money: NSNumber
    @NSManaged var name: String
    @NSManaged var wins: NSNumber

    convenience init() {
        //get context
        let context: NSManagedObjectContext = DatabaseManager.sharedInstance.managedObjectContext!

        //create entity description
        let entityDescription: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "User", in: context)

        //Call super using
        self.init(entity: entityDescription!, insertInto: context)
    }
}
