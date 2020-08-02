//
//  ViewController.swift
//  tipIt!
//
//  Created by Roderick Bishop on 8/1/20.
//  Copyright © 2020 Roderick Bishop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmtLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let percentages = [0.1, 0.15, 0.2]
        let tip = bill * percentages[tipControl.selectedSegmentIndex]
        let total = tip+bill
        
        tipAmtLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
    
}

