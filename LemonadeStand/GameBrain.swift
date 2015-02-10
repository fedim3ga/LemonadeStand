//
//  GameBrain.swift
//  LemonadeStand
//
//  Created by Ben Blanchard on 10/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation

class GameBrain {
    
    class func didTheyLike(customer:Customer, mixRatio:Double) -> Bool {
        
        if customer.ratio < 0.4 && customer.ratio >= 0.0 && mixRatio > 1.0 {
            return true
        }
        else if customer.ratio <= 0.6 && customer.ratio >= 0.4 && mixRatio == 1.0 {
            return true
        }
        else if customer.ratio <= 1.0 && customer.ratio > 0.6 && mixRatio < 1.0 {
            return true
        }
        else {
            return false
        }
    }

}