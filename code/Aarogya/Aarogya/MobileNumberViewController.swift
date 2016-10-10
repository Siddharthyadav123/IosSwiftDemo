//
//  MobileNumberViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/26/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class MobileNumberViewController: BaseViewController {
    
    
    @IBAction func textFieldMobileNum(sender: AnyObject) {
       
    }
    
    @IBOutlet weak var sendOTPButton: UIButton!
    
    
    @IBAction func sendOTPButton(sender: AnyObject) {
        
    }
    /*
    *  IBAction of Back Button
    */
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    *  This method is for keyboard dismiss on touch of anywhere in screen
    */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
     
func keyboardWillShow(notification: NSNotification) {
    
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
        self.sendOTPButton.frame.origin.y -= keyboardSize.height
    }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.sendOTPButton.frame.origin.y += keyboardSize.height
        }
    
    }

}

    

