//
//  Feature.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation
import CoreData

class Feature: NSManagedObject {
    
    @NSManaged var cod: NSNumber
    @NSManaged var number: NSNumber
    @NSManaged var special: Card
    
    convenience init()
    {
        //get context
        let context: NSManagedObjectContext = DatabaseManager.sharedInstance.managedObjectContext!
        
        //create entity description
        let entityDescription: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Feature", in: context)
        
        //Call super using
        self.init(entity:entityDescription!, insertInto: context)
    }
}
