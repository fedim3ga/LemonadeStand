//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Ben Blanchard on 08/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var lemonStockLabel: UILabel!
    @IBOutlet weak var iceStockLabel: UILabel!
    @IBOutlet weak var lemonPurchaseLabel: UILabel!
    @IBOutlet weak var icePurchaseLabel: UILabel!
    @IBOutlet weak var lemonMixLabel: UILabel!
    @IBOutlet weak var iceMixLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startDayButtonPressed(sender: AnyObject) {
        println("Day started!")
    }

    @IBAction func lemonPurchaseAddButtonPressed(sender: AnyObject) {
        println("Purchase 1 lemon")
    }
    
    @IBAction func lemonPurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 lemon")
    }
    
    @IBAction func icePurchaseAddButtonPressed(sender: AnyObject) {
        println("Purchase 1 ice cube")
    }
    
    @IBAction func icePurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 ice cube")
    }

    @IBAction func lemonMixAddButtonPressed(sender: AnyObject) {
        println("Add 1 lemon to mix")
    }

    @IBAction func lemonMixMinusButtonPressed(sender: AnyObject) {
        println("Remove 1 lemon from mix")
    }
    
    @IBAction func iceMixAddButtonPressed(sender: AnyObject) {
        println("Add 1 ice cube to mix")
    }
    
    @IBAction func iceMixMinusButtonPressed(sender: AnyObject) {
        println("Remove 1 ice cube from mix")
    }
    
    
    
    
    
    
    
    
}

