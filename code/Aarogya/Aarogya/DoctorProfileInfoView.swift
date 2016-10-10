//
//  DoctorProfileInfoView.swift
//  Aarogya
//
//  Created by ranjit singh on 4/19/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class DoctorProfileInfoView: UIView {
    
    

    var doctorsProfileVC = DoctorsProfileViewController()
    

       var uiview:UIView?
    // For allTiming Button
    @IBOutlet weak var allTiming: UIButton!
    @IBAction func allTiming(sender: AnyObject) {
    let allTimingVC = AllTimingViewController()
    doctorsProfileVC.presentViewController(allTimingVC, animated: true, completion: nil)
                }

    
    //For AllFeedback Button
    @IBOutlet weak var allFeedBacks: UIButton!
    @IBAction func allFeedbacks(sender: AnyObject) {
    let allFeedbackVC = AllFeedbackViewController()
    doctorsProfileVC.presentViewController(allFeedbackVC, animated: true, completion: nil)
          }
   
    
    
    
    //For allServicesButton
    @IBOutlet weak var allServices: UIButton!
    @IBAction func allServices(sender: AnyObject) {
        let allServicesVC = AllServicesViewController()
        doctorsProfileVC.presentViewController(allServicesVC, animated: true, completion: nil)

    }
  
    
    
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
       uiview =  NSBundle.mainBundle().loadNibNamed("DoctorProfileInfoView", owner: self, options: nil)[0] as! UIView
//        guard let content = uiview else { return }
        uiview!.frame = CGRectMake(0, 0, 320, 768)
//        uiview!.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        self.addSubview(uiview!)
        
//        self = NSBundle.mainBundle().loadNibNamed("DoctorProfileInfoView", owner: self, options: nil)[0] as? UIView
    }
    
}
