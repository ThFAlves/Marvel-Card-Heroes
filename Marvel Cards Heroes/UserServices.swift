//
//  UserServices.swift
//  Marvel
//
//  Created by Thiago Felipe Alves on 15/07/15.
//  Copyright (c) 2015 Thiago Felipe Alves. All rights reserved.
//

import Foundation

class UserServices {
    static func createUser(name: String, wins: NSNumber, loss: NSNumber, level: NSNumber, money: NSNumber) {

        let user = User()
        user.name = name
        user.wins = wins
        user.loss = loss
        user.level = level
        user.money = money
        
        // insert it
        UserDAO.insert(objectToBeInserted: user)
    }

    static func buy (money: NSNumber) -> Bool {
        let exist = UserDAO.verifMoney(money: money)
        
        if exist {
            UserDAO.decMoney(money: money)
            return true
        }
        return false
    }
}
