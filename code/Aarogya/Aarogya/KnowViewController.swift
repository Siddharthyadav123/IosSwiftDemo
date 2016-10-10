//
//  KnowViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/8/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class KnowViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate
    
{
   
    @IBOutlet weak var knowTabItem: UITabBarItem!
    @IBOutlet weak var knowTableVCOutlet: UITableView!
    @IBOutlet weak var knowLabelOutlet: UILabel!
    @IBOutlet weak var dotLabelOutlet: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        knowTableVCOutlet.dataSource = self
//        knowTableVCOutlet.delegate = self
       
        
        
//        // to register the xib
        let yourNibName = UINib(nibName: "DoctorsInfoTableViewCell", bundle: nil)
        knowTableVCOutlet.registerNib(yourNibName, forCellReuseIdentifier: "docInfoIdentifier")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * Shares the info.
     */
    func shareInfo(){
        
        let firstActivityItem = "Hey!!! you came to right place."
        let secondActivityItem : NSURL = NSURL(string: "")!
        // If you want to put an image
        let image : UIImage = UIImage(named: "share")!
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
        
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypePrint,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo
        ]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    var arr : NSMutableArray = [1,2,3,4,5]
    //arr = [1,2,3,4,5]
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath")
        let commentScreenVC = CommentScreenViewController ()
        self.navigationController?.pushViewController(commentScreenVC, animated: true)
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("In numberOfRowsInSection")
        return arr.count;
        
        
    }
    
    
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //  print("In cellForRowAtIndexPath")
        var cell:DoctorsInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("docInfoIdentifier", forIndexPath:indexPath)as! DoctorsInfoTableViewCell
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "DoctorsInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "docInfoIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("docInfoIdentifier") as? DoctorsInfoTableViewCell
        }
        cell.likeUnlikeButton.tag = indexPath.row
        cell.knowViewController = self
        return cell;
    }
    
    
}

