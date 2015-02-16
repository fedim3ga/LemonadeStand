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

    

    var lemonPurchased = 0
    var icePurchased = 0
    var lemonMixed = 0
    var iceMixed = 0
    var mixRatio:Double = 0
    
    var price = Price()
    var supplies = Supplies(aMoney: 20, aLemons: 1, aIceCubes: 1)
    
    var weatherArray: [[Int]] = [[-10, -9, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
    
    var weatherToday: [Int] = [0, 0, 0, 0]
    
    var weatherImageView: UIImageView = UIImageView(frame: CGRectMake(0, 50, 50, 50))

    



    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(weatherImageView)
        view.addSubview(weatherImageView)

        simulateWeatherToday()
        updateView()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startDayButtonPressed(sender: AnyObject) {
        println("Day started!")
        println(weatherImageView.image)
        if lemonMixed <= 0 || iceMixed <= 0 {
            showAlertWithText(message: "You must add at least one of each item to the mix")
        }
        else {
            
            let average = findAverage(weatherToday)
            let customers = Int(arc4random_uniform(UInt32(abs(average))))
            println("customers: \(customers)")
            
            var mixRatio = calcMixRatio()

            for x in 0...customers {
                
                let preference = Double(arc4random_uniform(UInt32(100))) / 100
                
                if preference < 0.4 && mixRatio > 1 {
                    supplies.money += 2
                    println("Paid")
                }
                else if preference > 0.6 && mixRatio < 1 {
                    supplies.money += 2
                    println("Paid")
                }
                else if preference <= 0.6 && preference >= 0.4 && mixRatio == 1 {
                    supplies.money += 2
                    println("Paid")
                }
                else {
                    println("no match, no revenue")
                }
            }

            lemonMixed = 0
            iceMixed = 0
            lemonPurchased = 0
            icePurchased = 0
            
            
            simulateWeatherToday()
            updateView()
            
            if supplies.money < 3 {
                showAlertWithText(header: "GAME OVER", message: "You ran out of cash")
            }
            else {
                println("")
            }

            
            
        }
        
        

        
    }
    
    
    // PURCHASE AND UNPURCHASE BUTTONS

    @IBAction func lemonPurchaseAddButtonPressed(sender: AnyObject) {

        if supplies.money < price.lemon {
            showAlertWithText(header: "Warning", message: "You don't have enough money!")
        } else {
            lemonPurchased += 1
            supplies.lemons += 1
            supplies.money -= price.lemon
            updateView()
        }
    }
    
    @IBAction func lemonPurchaseMinusButtonPressed(sender: AnyObject) {

        
        if lemonPurchased <= 0 {
            showAlertWithText(header: "Unable to sell", message: "You can't sell lemons")
        } else if supplies.lemons <= 0 {
            showAlertWithText(message: "You can't have a negative amount of lemons. Remove some from the mix")
        } else {
            lemonPurchased -= 1
            supplies.lemons -= 1
            supplies.money += price.lemon
            updateView()
        }

    }
    
    @IBAction func icePurchaseAddButtonPressed(sender: AnyObject) {

        
        if supplies.money < 1 {
            showAlertWithText(header: "Warning", message: "You don't have enough money!")
        } else {
            icePurchased += 1
            supplies.iceCubes += 1
            supplies.money -= price.iceCube
            updateView()
        }
        
    }
    
    @IBAction func icePurchaseMinusButtonPressed(sender: AnyObject) {

       
        if icePurchased <= 0 {
            showAlertWithText(header: "Unable to sell", message: "You can't sell ice")
        } else if supplies.iceCubes <= 0 {
            showAlertWithText(message: "You can't have a negative amount of ice cubes. Remove some from the mix")
        } else {
            icePurchased -= 1
            supplies.iceCubes -= 1
            supplies.money += price.iceCube
            updateView()
        }
        
    }
    
    //
    
    // MIX AND UNMIX BUTTONS

    @IBAction func lemonMixAddButtonPressed(sender: AnyObject) {

        if supplies.lemons <= 0 {
            showAlertWithText(message: "No more lemons!")
        }
        else {
            supplies.lemons -= 1
            lemonMixed += 1
            updateView()
        }
    }

    @IBAction func lemonMixMinusButtonPressed(sender: AnyObject) {

        
        if lemonMixed <= 0 {
            showAlertWithText(message: "No more lemons from mix!")
        }
        else {
            supplies.lemons += 1
            lemonMixed -= 1
            updateView()
        }
    }
    
    @IBAction func iceMixAddButtonPressed(sender: AnyObject) {

        if supplies.iceCubes <= 0 {
            showAlertWithText(message: "No more ice!")
        }
        else {
            supplies.iceCubes -= 1
            iceMixed += 1
            updateView()
        }
    }
    
    @IBAction func iceMixMinusButtonPressed(sender: AnyObject) {

        
        if iceMixed <= 0 {
            showAlertWithText(message: "No more ice from mix!")
        }
        else {
            supplies.iceCubes += 1
            iceMixed -= 1
            updateView()
        }
    }
    
    //
    
    func calcMixRatio() -> Double {
        
        var mixRatio = Double(lemonMixed)/Double(iceMixed)
        println("Mix Ratio: \(mixRatio)")
        return mixRatio
    }
    

    func updateView() {
        lemonStockLabel.text = "\(supplies.lemons)"
        iceStockLabel.text = "\(supplies.iceCubes)"
        cashLabel.text = "$\(supplies.money)"
        icePurchaseLabel.text = "\(icePurchased)"
        lemonPurchaseLabel.text = "\(lemonPurchased)"
        lemonMixLabel.text = "\(lemonMixed)"
        iceMixLabel.text = "\(iceMixed)"
    }
    
    func showAlertWithText(header:String = "Warnings", message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func simulateWeatherToday() {
        let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        weatherToday = weatherArray[index]
        switch index {
            case 0: weatherImageView.image = UIImage(named: "Cold")
            case 1: weatherImageView.image = UIImage(named: "Mild")
            case 2: weatherImageView.image = UIImage(named: "Warm")
            default: weatherImageView.image = UIImage(named: "Warm")
        }
    }
    
    func findAverage(data:[Int]) -> Int {
        var sum = 0
        
        for x in data {
            sum += x
        }
        
        // get average
        
        var average:Double = Double(sum) / Double(data.count)
        var rounded:Int = Int(ceil(average))
        return rounded
        }
    
    
    
    
    
    
}

