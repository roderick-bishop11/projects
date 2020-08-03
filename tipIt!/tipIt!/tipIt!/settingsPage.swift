//
//  settingsPage.swift
//  tipIt!
//
//  Created by Roderick Bishop on 8/2/20.
//  Copyright © 2020 Roderick Bishop. All rights reserved.
//

import UIKit

class settingsPage: UIViewController {

    @IBOutlet weak var toggleText: UILabel!
    @IBOutlet weak var roundToSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard.getValueOfSwitch()!
        
        //sets the switch to use default
        if defaults{
            roundToSwitch.setOn(true, animated: true)
            toggleText.text = "Round to Dollar Shown"
        }
        else{
            roundToSwitch.setOn(false, animated: true)
            toggleText.text = "Round to Dollar Hidden"
        }
    }
    
    
    @IBAction func onLinkClick(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://github.com/roderick-bishop11")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            //sender is on now
               UserDefaults.standard.setValueForSwitch(value: true)
               //roundToSwitch.setOn(true, animated: true)
            toggleText.text = "Round to Dollar Shown"
           }
           else{
            //sender is not on
               UserDefaults.standard.setValueForSwitch(value: false)
              // roundToSwitch.setOn(false, animated: true)
            toggleText.text = "Round to Dollar Hidden"
    }
    }
    

}
