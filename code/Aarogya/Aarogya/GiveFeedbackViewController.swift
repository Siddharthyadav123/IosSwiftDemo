//
//  GiveFeedbackViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/21/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class GiveFeedbackViewController: BaseViewController {
    
    let checkedImage = UIImage(named: "shape")! as UIImage
    
    let uncheckedImage = UIImage(named: "interface (1)")! as UIImage

    
    @IBOutlet weak var setImage: UIImageView!
    
    
    @IBOutlet weak var radioImageVC: UIView!
    
    
    @IBAction func buttonClicked4(sender: AnyObject) {
        self.selectedImage1.hidden = true
        self.selectedImage2.hidden = true
        self.selectedImage3.hidden = true
        self.selectedImage4.hidden = false
    }
    
    @IBAction func buttonClicked3(sender: AnyObject) {
        self.selectedImage1.hidden = true
        self.selectedImage2.hidden = true
        self.selectedImage3.hidden = false
        self.selectedImage4.hidden = true
    }
    
    @IBAction func buttonClicked2(sender: AnyObject) {
        self.selectedImage1.hidden = true
        self.selectedImage2.hidden = false
        self.selectedImage3.hidden = true
        self.selectedImage4.hidden = true
        
    }
    
    @IBAction func buttonClicked1(sender: AnyObject) {
        self.selectedImage1.hidden = false
        self.selectedImage2.hidden = true
        self.selectedImage3.hidden = true
        self.selectedImage4.hidden = true
        
    }
 
    @IBOutlet weak var selectedImage2: UIImageView!
    @IBOutlet weak var selectedImage1: UIImageView!
    @IBOutlet weak var selectedImage4: UIImageView!
    @IBOutlet weak var selectedImage3: UIImageView!
 


    @IBAction func termsConditionsButton(sender: AnyObject) {
        if let url = NSURL(string:"https://www.google.co.in/?ion=1&espv=2#q=vyako%20technologies%20pvt.%20ltd") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedImage1.hidden = true
        self.selectedImage2.hidden = true
        self.selectedImage3.hidden = true
        self.selectedImage4.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
       
   }
