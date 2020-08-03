//
//  userDefaults.swift
//  tipIt!
//
//  Created by Roderick Bishop on 8/2/20.
//  Copyright © 2020 Roderick Bishop. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    func setValueForSwitch(value: Bool?){
        if value != nil{
            UserDefaults.standard.set(value, forKey:"roundTo")
        }
        else {
            UserDefaults.standard.removeObject(forKey: "roundTo")
        }
        
        UserDefaults.standard.synchronize()
    }
    
    func getValueOfSwitch()-> Bool?{
        return UserDefaults.standard.value(forKey: "roundTo") as? Bool
        
    }
}
