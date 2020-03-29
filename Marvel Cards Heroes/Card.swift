//
//  Card.swift
//  Marvel Cards Heroes
//
//  Created by Thiago Felipe Alves on 20/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import Foundation
import CoreData

class Card: NSManagedObject {

    @NSManaged var durability: NSNumber
    @NSManaged var combat: NSNumber
    @NSManaged var intelligence: NSNumber
    @NSManaged var name: String
    @NSManaged var power: NSNumber
    @NSManaged var quantity: NSNumber
    @NSManaged var speed: NSNumber
    @NSManaged var strength: NSNumber
    @NSManaged var deck: NSNumber
    @NSManaged var category: String
    @NSManaged var special: Feature

    convenience init()
    {
        //get context
        let context: NSManagedObjectContext = DatabaseManager.sharedInstance.managedObjectContext!
        
        //create entity description
        let entityDescription: NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Card", in: context)
        
        //Call super using
        self.init(entity:entityDescription!, insertInto: context)
    }
}
