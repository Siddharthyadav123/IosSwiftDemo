//
//  AllServicesViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/21/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class AllServicesViewController: BaseViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
     @IBOutlet weak var closeButton: UIButton!
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    var data=["Implantology","Implants","Implants Tooth Fixing","Implant Retaines Dentures","Dental Implants","Orthodontic Alignment","Myofunctional Orthodontics"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    func setAttributes(){
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "allServices")
    self.tableView.tableFooterView = UIView()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
    
    //    return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("allServices", forIndexPath: indexPath) 
    //cell.textLabel?.text = "Doctors"
    cell.textLabel?.text = data[indexPath.row]
 
    
    
    
    let imageName = UIImage(named:"icon.png")
    cell.imageView?.image = imageName
    resizeTableViewCellContents(cell)
    return cell
    
        
    }
    
    func resizeTableViewCellContents(cell:UITableViewCell){
        let itemSize:CGSize = CGSizeMake(5, 5)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.mainScreen().scale)
        let imageRect : CGRect = CGRectMake(0, 0, itemSize.width, itemSize.height)
        cell.imageView!.image?.drawInRect(imageRect)
        cell.imageView!.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

   
}
