//
//  TermsandConditionScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/20/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class TermsandConditionScreenViewController: BaseViewController {

    @IBOutlet weak var scrollViewContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSizeMake(320, 568)
    }

    @IBAction func termsAndConditionButton(sender: AnyObject) {
        if let url = NSURL(string:"https://www.google.co.in/?ion=1&espv=2#q=vyako%20technologies%20pvt.%20ltd") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
   
}
