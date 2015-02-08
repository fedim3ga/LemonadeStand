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
        lemonStock += 1
        cash -= 2
        updateView()
    }
    
    @IBAction func lemonPurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 lemon")
        
        if lemonStock <= 0 {
            showAlertWithText(header: "0 lemons", message: "You can't have less than 0 lemons")
        } else {
            lemonStock -= 1
            cash += 2
            updateView()
        }

    }
    
    @IBAction func icePurchaseAddButtonPressed(sender: AnyObject) {
        println("Purchase 1 ice cube")
        iceStock += 1
        cash -= 1
        updateView()
    }
    
    @IBAction func icePurchaseMinusButtonPressed(sender: AnyObject) {
        println("Unpurchase 1 ice cube")
       
        if iceStock <= 0 {
            showAlertWithText(header: "0 ice cubes", message: "You can't have less than 0 ice cubes")
        } else {
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
    }
    
    func showAlertWithText(header:String = "Warnings", message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

