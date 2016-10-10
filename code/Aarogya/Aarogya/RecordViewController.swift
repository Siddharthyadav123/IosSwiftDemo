//
//  RecordViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/8/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class RecordViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var recordTableVC = RecordTableViewCell()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        //loadSubView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAttributes(){
        let yourNibName = UINib(nibName: "RecordTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "recordIdentifier")
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:RecordTableViewCell! = tableView.dequeueReusableCellWithIdentifier("recordIdentifier", forIndexPath:indexPath)as! RecordTableViewCell
            recordTableVC.recordViewController=self
        
        
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "RecordTableViewCell", bundle: nil), forCellReuseIdentifier: "recordIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("recordIdentifier") as? RecordTableViewCell
        }
        cell.recordViewController = self
        return cell;
    }
    
    
    

    
}


