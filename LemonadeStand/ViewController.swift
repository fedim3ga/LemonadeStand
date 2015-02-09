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
    
    var lemonStock = 0
    var iceStock = 0
    var cash = 0
    var lemonPurchased = 0
    var icePurchased = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        cash = 10
        lemonStock = 1
        iceStock = 1
        updateView()
        
        
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
        
        if cash < 2 {
            showAlertWithText(header: "Warning", message: "You don't have enough money!")
        } else {
            lemonPurchased += 1
            lemonStock += 1
            cash -= 2
            updateView()
        }
    }
    
    @IBAction func lemonPurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 lemon")
        
        if lemonPurchased <= 0 {
            showAlertWithText(header: "Unable to sell", message: "You can't sell lemons")
        } else {
            lemonPurchased -= 1
            lemonStock -= 1
            cash += 2
            updateView()
        }

    }
    
    @IBAction func icePurchaseAddButtonPressed(sender: AnyObject) {
        println("Purchase 1 ice cube")
        
        if cash < 1 {
            showAlertWithText(header: "Warning", message: "You don't have enough money!")
        } else {
            icePurchased += 1
            iceStock += 1
            cash -= 1
            updateView()
        }
        
    }
    
    @IBAction func icePurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 ice cube")
       
        if icePurchased <= 0 {
            showAlertWithText(header: "Unable to sell", message: "You can't sell ice")
        } else {
            icePurchased -= 1
            iceStock -= 1
            cash += 1
            updateView()
        }
        
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
    
    func updateView() {
        lemonStockLabel.text = "\(lemonStock) lemons"
        iceStockLabel.text = "\(iceStock) ice cubes"
        cashLabel.text = "$\(cash)"
        icePurchaseLabel.text = "\(icePurchased)"
        lemonPurchaseLabel.text = "\(lemonPurchased)"
    }
    
    func showAlertWithText(header:String = "Warnings", message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

