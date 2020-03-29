//
//  CardsService.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation

class CardsServices
{
    static func createCard(name:String, intelligence: NSNumber, strength: NSNumber, speed: NSNumber, durability: NSNumber, power: NSNumber, combat: NSNumber, quantity: NSNumber, category: String)
    {
        var card:Card = Card()
        card.name = name
        card.intelligence = intelligence
        card.strength = strength
        card.speed = speed
        card.durability = durability
        card.power = power
        card.combat = combat
        card.quantity = quantity
        card.category = category
        
        // insert it
        CardDAO.insert(objectToBeInserted: card)
        
    }
    
}
