//
//  ProfileSignUpViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/25/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ProfileSignUpViewController: BaseViewController {
    
    /*
    * This Button is for Terms & Conditions
    */
         @IBAction func termsconditionsButton(sender: AnyObject) {
        
        if let url = NSURL(string:"https://www.google.co.in/?ion=1&espv=2#q=vyako%20technologies%20pvt.%20ltd") {
            UIApplication.sharedApplication().openURL(url)
        }

    }
    
    /*
     *This is password textfield outlet
     */
   
    @IBOutlet weak var pasword: UITextField!
    
    
    /*
    *This is for create an account Button
    */
    
    @IBOutlet weak var createAnAccount: UIButton!
    @IBAction func createAnAccountButton(sender: AnyObject) {
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
    *This is for Login Button
    */
    @IBAction func logInButton(sender: AnyObject) {
        let profileSignInVC = ProfileSignInViewController()
        self.navigationController?.pushViewController(profileSignInVC, animated: true)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    /*
    * To Disable Autorotation
    */
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
}
