//
//  ProfileViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/8/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var contentViewProfile: UIView!
    @IBOutlet weak var scrollViewProfile: UIScrollView!
    @IBOutlet weak var editButton: UIButton!
    @IBAction func editButton(sender: AnyObject) {
        let editProfileVC = EditProfileViewController()
        self.presentViewController(editProfileVC, animated: true, completion: nil)
        
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
       scrollViewProfile.contentSize = CGSizeMake(320, 568)
    }
    
      //  scrollViewProfile.contentSize = CGSize(width:160, height:160)
    }
    


