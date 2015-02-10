//
//  GameBrain.swift
//  LemonadeStand
//
//  Created by Ben Blanchard on 10/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation

class GameBrain {
    
    class func didTheyBuy(arrayOfCustomers:[Customer]) -> Int {
    
        var earnings = 0
        
        for var index = 0; index < arrayOfCustomers.count; index++ {
            if didTheyLike(arrayOfCustomers[index]) == true {
                earnings += 1
                println("Sale!")
            }
            else {
                println("No sale :(")
            }
        }
        return earnings
        
    }
    
    
    class func didTheyLike(customer:Customer) -> Bool {
        // Got to be a better way to do it. Why won't class function work? Why do I have to create an instance?

        
        // SOMETHING WRONG WITH MIX RATIO
        var mixRatio = ViewController.calcMixRatio()
        
        if customer.ratio < 0.4 && customer.ratio > 0.0 && mixRatio > 1.0 {
            return true
        }
        else if customer.ratio <= 0.6 && customer.ratio >= 0.4 && mixRatio == 1.0 {
            return true
        }
        else if customer.ratio < 1.0 && customer.ratio > 0.6 && mixRatio < 1.0 {
            return true
        }
        else {
            return false
        }
    }

}