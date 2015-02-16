//
//  Supplies.swift
//  LemonadeStand
//
//  Created by Ben Blanchard on 15/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation
import UIKit

struct Supplies {
    
    var money = 0
    var lemons = 0
    var iceCubes = 0
    
    init (aMoney: Int, aLemons: Int, aIceCubes: Int) {
        money = aMoney
        lemons = aLemons
        iceCubes = aIceCubes
    }
    
}