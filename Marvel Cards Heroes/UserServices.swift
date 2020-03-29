//
//  UserServices.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation

class UserServices
{
    static func createUser(name:String, wins:NSNumber, loss:NSNumber, level: NSNumber, money: NSNumber)
    {
        var user:User = User()
        user.name = name
        user.wins = wins
        user.loss = loss
        user.level = level
        user.money = money
        
        // insert it
        UserDAO.insert(objectToBeInserted: user)
        
    }
    
    static func buy (money: NSNumber) -> Bool
    {
        var exist = UserDAO.verifMoney(money: money)
        
        if (exist == true){
            
            UserDAO.decMoney(money: money)
            
            return true
        }else{
            return false
        }
    }
}
