//
//  AllFeedbackViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/21/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class AllFeedbackViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var label1MostHelpful: UILabel!
    @IBOutlet weak var label2Recent: UILabel!
    @IBOutlet weak var indexChangedButton: UISegmentedControl!
    @IBAction func indexChangedButton(sender: AnyObject) {
//        
//            switch indexChangedButton.selectedSegmentIndex
//            {
//            case 0:
//                label1MostHelpful.text = "First selected"
//            case 1:
//             label1MostHelpful.text = "Second Segment selected"
//            default: 
//                break; 
//            }
        
    }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       setAttributes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func setAttributes(){
        let yourNibName = UINib(nibName: "AllFeedbackTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "allFeedbackIdentifier")
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8;
    }
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:AllFeedbackTableViewCell! = tableView.dequeueReusableCellWithIdentifier("allFeedbackIdentifier", forIndexPath:indexPath)as! AllFeedbackTableViewCell
        
        
        
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "AllFeedbackTableViewCell", bundle: nil), forCellReuseIdentifier: "allFeedbackIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("allFeedbackIdentifier") as? AllFeedbackTableViewCell
        }
//        
//        cell.bookButton.layer.cornerRadius = 5.0
//        cell.bookButton.clipsToBounds = true
//        
        cell.allFeedbackVC=self
        return cell;
    }

    
    
}
