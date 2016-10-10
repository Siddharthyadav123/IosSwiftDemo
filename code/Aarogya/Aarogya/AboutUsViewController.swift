//
//  AboutUsViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/22/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class AboutUsViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var data=["Rate us on App store","Terms and Conditions","Call us for support","Mail us for support"]
    var dataimage=["favorite","tools","telephone","note"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setAttributes()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAttributes(){
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "About")
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("About", forIndexPath: indexPath)
        //cell.textLabel?.text = "Doctors"
        cell.textLabel?.text = data[indexPath.row]
        
        let imageName = UIImage(named: dataimage[indexPath.row])
        cell.imageView?.image = imageName
        resizeTableViewCellContents(cell)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0) { //Change 0 to the row you want
            self.AlertOnParticularRow()
        }else if(indexPath.row == 1){
          self.AlertOnParticularRow()
        }else if(indexPath.row == 2){
            self.AlertOnParticularRow()
        }else if(indexPath.row == 3){
            self.AlertOnParticularRow()
        }
    }
    
    func resizeTableViewCellContents(cell:UITableViewCell){
        let itemSize:CGSize = CGSizeMake(22, 22)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.mainScreen().scale)
        let imageRect : CGRect = CGRectMake(0, 0, itemSize.width, itemSize.height)
        cell.imageView!.image?.drawInRect(imageRect)
        cell.imageView!.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func AlertOnParticularRow(){
        let alert = UIAlertView()
        alert.title = "Note"
        alert.message = "Coming Soon!"
        alert.addButtonWithTitle("Okay")
        alert.show()

    }
      
}
