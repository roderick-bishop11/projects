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
    @IBOutlet weak var roundTo: UITextField!
    @IBOutlet weak var textAboveRound: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard

        if defaults.bool(forKey: "roundTo"){
            textAboveRound.isHidden = false;
            roundTo.isHidden = false;
        }
        else{
            textAboveRound.isHidden = true;
                       roundTo.isHidden = true;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmount.becomeFirstResponder()
    }
    
    
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let round = Double(roundTo.text!) ?? 0
        let percentages = [0.0, 0.1, 0.15, 0.2]
        
        var tip = 0.0
        var total = 0.0
        var tipRound = 0.0
        var totalRound = 0.0
       
        //so if we aren't rounding to a dollar amount, we simply use the segments
        if(roundTo.hasText == true && tipControl.selectedSegmentIndex == 0){
             tipRound = round - bill
            totalRound = bill+tipRound
            tipAmtLabel.text = convertToCurrency(num:tipRound)
            totalLabel.text = convertToCurrency(num:totalRound)
            tipControl.selectedSegmentIndex = 0; //set it to zero
        }
            //this will clean text and change the tip & total
        else if (roundTo.hasText == true && tipControl.selectedSegmentIndex != 0){
            tip = bill * percentages[tipControl.selectedSegmentIndex]
          total = tip+bill
            tipAmtLabel.text = convertToCurrency(num:tip)
            totalLabel.text = convertToCurrency(num:total)
            roundTo.text?.removeAll() //removes text
        }
       else {
            tip = bill * percentages[tipControl.selectedSegmentIndex]
            total = tip+bill
              tipAmtLabel.text = convertToCurrency(num:tip)
              totalLabel.text = convertToCurrency(num:total)        }
    }
    
    
    @IBAction func resetSegment(_ sender: Any) {
        tipControl.selectedSegmentIndex = 0; //sets it back to zero as soon as you begin editing
        calcTip(self)
    }
    
    func convertToCurrency(num: Double) -> String{
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter.string(from: NSNumber(value: num))!
    }
    
    
}

