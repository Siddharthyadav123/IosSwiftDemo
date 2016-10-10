//
//  AllTimingViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/20/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class AllTimingViewController: BaseViewController ,UIScrollViewDelegate{
    
    // This is for Monday
    @IBOutlet weak var mDay: UILabel!
    @IBOutlet weak var mTiming: UILabel!
    @IBOutlet weak var mView: UIView!
    
    
    
    // This is for Tuesday
    @IBOutlet weak var tTiming: UILabel!
    @IBOutlet weak var tDay: UILabel!
    @IBOutlet weak var tView: UIView!
    
    
    
    
    // This is for Wednesday
    @IBOutlet weak var wDay: UILabel!
    @IBOutlet weak var wTiming: UILabel!
    @IBOutlet weak var wView: UIView!
    
   
    // This is for Thursday
    @IBOutlet weak var thuTiming: UILabel!
    @IBOutlet weak var thuDay: UILabel!
    @IBOutlet weak var thuView: UIView!
    
    
    
    // This is for Friday
    @IBOutlet weak var fTiming: UILabel!
    @IBOutlet weak var fDay: UILabel!
    @IBOutlet weak var fView: UIView!
    
    
    
    
    // This is for Saturday
    @IBOutlet weak var sTiming: UILabel!
    @IBOutlet weak var sDay: UILabel!
    @IBOutlet weak var sView: UIView!
    
    
    
    
    // This is for Sunday
    
    @IBOutlet weak var sunTiming: UILabel!
    @IBOutlet weak var sunDay: UILabel!
    @IBOutlet weak var sunView: UIView!
    
    
    var isMondaySelected = false;
    var isTuesdaySelected = false;
    var isWednesdaySelected = false;
    var isThursdaySelected = false;
    var isFridaySelected = false;
    var isSaturdaySelected = false;
    var isSundaySelected = false;
    
    
    
    // This is for MondayButton
     @IBAction func mButton(sender: AnyObject) {
        if isMondaySelected{
            deSelectDay(mDay, timingLable: mTiming)
        }else{
            doHighlightDay(mDay, timingLable: mTiming)
        }
        isMondaySelected = !isMondaySelected
       }
    
    
    
    // This is for TuesdayButton
    @IBAction func tButton(sender: AnyObject) {
        if isTuesdaySelected{
            deSelectDay(tDay, timingLable: tTiming)
        }else{
            doHighlightDay(tDay, timingLable: tTiming)
        }
        isTuesdaySelected = !isTuesdaySelected
    }
    
    // This is for WednesdayButton
    @IBAction func WButton(sender: AnyObject) {
        if isWednesdaySelected{
            deSelectDay(wDay, timingLable: wTiming)
        }else{
            doHighlightDay(wDay, timingLable: wTiming)
        }
        isWednesdaySelected = !isWednesdaySelected
    }
    
    
    // This is for ThursdayButton
    @IBAction func thuButton(sender: AnyObject) {
        if isThursdaySelected{
            deSelectDay(thuDay, timingLable: thuTiming)
        }else{
            doHighlightDay(thuDay, timingLable: thuTiming)
        }
        isThursdaySelected = !isThursdaySelected
    }
    
    
    // This is for FridayButton

    @IBAction func fButton(sender: AnyObject) {
        if isFridaySelected{
            deSelectDay(fDay, timingLable: fTiming)
        }else{
            doHighlightDay(fDay, timingLable: fTiming)
        }
        isFridaySelected = !isFridaySelected
     }
    
    
    // This is for SaturdayButton
    @IBAction func sButton(sender: AnyObject) {
        if isSaturdaySelected{
            deSelectDay(sDay, timingLable: sTiming)
        }else{
            doHighlightDay(sDay, timingLable: sTiming)
        }
        isSaturdaySelected = !isSaturdaySelected
        }
    
    
    // This is for SundayButton
      @IBAction func sunButton(sender: AnyObject) {
        if isSundaySelected{
            deSelectDay(sunDay, timingLable: sunTiming)
        }else{
            doHighlightDay(sunDay, timingLable: sunTiming)
        }
        isSundaySelected = !isSundaySelected
        }
    
    
    /*
    * DO highlight the day row.
    */
    func doHighlightDay(dayLabel:UILabel, timingLable:UILabel){
        dayLabel.font = UIFont.boldSystemFontOfSize(15.0)
        timingLable.font = UIFont.boldSystemFontOfSize(15.0)
        
    }
    
    /*
    * Remove highlight & make the day row normal.
    */
    func deSelectDay(dayLabel:UILabel, timingLable:UILabel){
        dayLabel.font = UIFont.systemFontOfSize(15.0)
        timingLable.font = UIFont.systemFontOfSize(15.0)

    }
    
    // For closeButton
    @IBOutlet weak var closeButton: UIButton!
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
       
}
