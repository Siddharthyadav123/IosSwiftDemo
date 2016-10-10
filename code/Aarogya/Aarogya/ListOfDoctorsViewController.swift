//
//  ListOfDoctorsViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/18/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ListOfDoctorsViewController: BaseViewController {
    
    var listOfDoctorsTableVC = ListOfDoctorsTableViewCell()
    
    @IBOutlet weak var mainViewContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var tableViewContainer: UIView!
    @IBAction func filterButton(sender: AnyObject) {
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setAttributes()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    * Method for launching doctors profile controller
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let DoctorsProfileVC = DoctorsProfileViewController()
        
        self.navigationController?.pushViewController(DoctorsProfileVC, animated: true)
        
        
    }
    
    
    
    func setAttributes(){
        let yourNibName = UINib(nibName: "ListOfDoctorsTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "listIdentifier")
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8;
    }
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:ListOfDoctorsTableViewCell! = tableView.dequeueReusableCellWithIdentifier("listIdentifier", forIndexPath:indexPath)as! ListOfDoctorsTableViewCell
        listOfDoctorsTableVC.listOfDoctorsVC=self
        
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "ListOfDoctorsTableViewCell", bundle: nil), forCellReuseIdentifier: "listIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("listIdentifier") as? ListOfDoctorsTableViewCell
        }
        
        // To set tag to bookButton & also set title to button
        if indexPath.row % 2 == 0{
            cell.bookButton.setTitle("Book", forState: UIControlState.Normal)
            cell.bookButton.tag = 1
            //print("tag = 1")
            
            
        } else {
            cell.bookButton.setTitle("Call", forState: UIControlState.Normal)
            cell.bookButton.tag = 2
            //print("tag = 2")
        }
        
        
        cell.bookButton.layer.cornerRadius = 5.0
        cell.bookButton.clipsToBounds = true
        
        cell.listOfDoctorsVC=self
        return cell;
    }
    
}
