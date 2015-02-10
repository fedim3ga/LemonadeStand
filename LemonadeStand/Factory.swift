//
//  Factory.swift
//  LemonadeStand
//
//  Created by Ben Blanchard on 10/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation

class Factory {
    
    class func createCustomers() -> [Customer] {

        var randomNumberOfCustomers = Int(arc4random_uniform(UInt32(10)))
        var customerArray:[Customer] = []
        
        for var index = 0; index < randomNumberOfCustomers; index++ {
           
            

            var randomRatioValue1 = Int(arc4random_uniform(UInt32(10)))
            var randomRatioValue2 = Int(arc4random_uniform(UInt32(10)))
            var customerPreferenceRatio:Double = Double(randomRatioValue1) / Double(randomRatioValue2)

            
            do {
                randomRatioValue1 = Int(arc4random_uniform(UInt32(10)))
                randomRatioValue2 = Int(arc4random_uniform(UInt32(10)))
                customerPreferenceRatio = Double(randomRatioValue1) / Double(randomRatioValue2)
            } while customerPreferenceRatio > 1
            
            
            var customer = Customer(ratio: customerPreferenceRatio)
            customerArray.append(customer)
            println(customerPreferenceRatio)
            }
        return customerArray
    }
    
}
