//
//  ProfileSignInViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/25/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ProfileSignInViewController: BaseViewController {
    
    
    /*
    * To Disable Autorotation
    */
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    /*
    *This is for show & hide Button
    */
    @IBOutlet weak var showtxtButton: UIButton!
    @IBAction func showtxtButton(sender: AnyObject) {
        if (self.pasword.secureTextEntry ==  true) {
            self.showtxtButton.setTitle("Hide", forState: UIControlState.Normal)
            self.pasword.secureTextEntry = false;
            
        }
            
        else
        {
            self.showtxtButton.setTitle("Show", forState: UIControlState.Normal)
            self.pasword.secureTextEntry = true;
        }
        }
    
    /*
    *This is for Login to your Account Button
    */
    @IBOutlet weak var loginToYourAccount: UIButton!
    @IBAction func loginToYourAccountButton(sender: AnyObject) {
    }
    
    /*
    *This is for Login With Facebook Button
    */
    @IBOutlet weak var loginWithFb: UIButton!
    @IBAction func loginWithFbButton(sender: AnyObject) {
    }
    
    /*
    *This is password textfield outlet
    */

    @IBOutlet weak var pasword: UITextField!
    
    
    
    /*
    *This is Register Button
    */

    @IBAction func registerButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    /*
    * Instance of an profileSIgnUpViewController
    */
   let profileSignUpVC = ProfileSignUpViewController()
   
}
