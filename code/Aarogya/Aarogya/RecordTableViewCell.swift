//
//  RecordTableViewCell.swift
//  Aarogya
//
//  Created by ranjit singh on 4/14/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
     var recordViewController:RecordViewController!
    
    @IBOutlet weak var recordsContentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var recordView: UIView!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBAction func cancelButton(sender: AnyObject) {
        let giveFeedbackVC = GiveFeedbackViewController()
        recordViewController.presentViewController(giveFeedbackVC, animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}