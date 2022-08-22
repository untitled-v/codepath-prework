//
//  ViewController.swift
//  Prework
//
//  Created by Srivasudha Ramanujam on 8/9/22.
//

import UIKit
import SwiftUI
//
//var tipOne = 15
//var tipTwo = 18
//var tipThree = 20

class ViewController: UIViewController {
//    @State  var tipOne : Int = 15
//    @State  var tipTwo : Int = 18
//    @State  var tipThree : Int = 20
    var tipOne = 15
    var tipTwo = 18
    var tipThree = 20
    

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var perPartyCostLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        partySizeStepper.wraps = false
        tipControl.setTitle(String(tipOne) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(tipTwo) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(tipThree) + "%", forSegmentAt: 2)
        // Do any additional setup after loading the view.
    }

    @IBAction func showSettings(_ sender: Any) {
        let settings = storyboard?.instantiateViewController(identifier: "settings_screen") as! SettingsViewController
        present(settings, animated: true)
        
    }
    
    @IBAction func partySizeStepper(_ sender: UIStepper) {
        
        partySizeLabel.text = String(Int(sender.value))
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let partySize = partySizeStepper.value
        
        let tipPercentages = [tipOne, tipTwo, tipThree]
        
        let tip : Double = bill * Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100
        let total = bill + tip
        
        let perPartyAmount = total / partySize

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        perPartyCostLabel.text = String(format: "$%.2f", perPartyAmount) + " per person"
        
    }
    
    func updateFirstTip(firstTip: Int){
        tipOne = firstTip
        tipControl.setTitle(String(tipOne) + "%", forSegmentAt: 0)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showSettings"
//            {
//                let controller = (segue.destination as! UINavigationController).topViewController as! SettingsViewController
//            }
//       // Get the new view controller using segue.destination.
//       // Pass the selected object to the new view controller.
//   }

    
}

