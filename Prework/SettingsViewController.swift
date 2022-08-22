//
//  SettingsViewController.swift
//  Prework
//
//  Created by Srivasudha Ramanujam on 8/10/22.
//

import UIKit
import SwiftUI

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOneField: UITextField!
    @IBOutlet weak var tipTwoField: UITextField!
    @IBOutlet weak var tipThreeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var firstTip = 15
    var secondTip = 18
    var thirdTip = 20
    
    
    
    @IBAction func idk(_ sender: Any) {
        print("click save")
    }
    
    
    
    @IBAction func save_settings_and_return(_ sender: Any) {
        firstTip = Int(tipOneField.text!) ?? 15
        secondTip = Int(tipTwoField.text!) ?? 18
        thirdTip = Int(tipThreeField.text!) ?? 20
        
        
//        let first_screen = storyboard?.instantiateViewController(identifier: "main_screen") as! ViewController
//        present(first_screen, animated: true)
        
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let first_screen = segue.destination as! ViewController
    
        first_screen.tipOne = firstTip
        first_screen.tipTwo = secondTip
        first_screen.tipThree = thirdTip

    }

     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    

}
