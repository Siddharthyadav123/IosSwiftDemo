//
//  TutorialOnlyForFirstLaunch.swift
//  Aarogya
//
//  Created by ranjit singh on 6/1/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class TutorialOnlyForFirstLaunch: NSObject {
    
    
    /*
    * Set boolean value into preferences
    */
    func setValueInPreferences(value:Bool,key:String){
        NSUserDefaults.standardUserDefaults().setBool(value, forKey: key)
    }
    
    
    /*
    * Retrive/Get boolean value into preferences
    */
    func getValueFromPreferences(key:String)->Bool{
        let isAppAlreadyLaunch = NSUserDefaults.standardUserDefaults().boolForKey(key)
        return isAppAlreadyLaunch;
    }

}
