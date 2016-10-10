//
//  SelectTimeTableViewCell.swift
//  Aarogya
//
//  Created by ranjit singh on 5/18/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class SelectTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var txtLabel3: UILabel!
    @IBOutlet weak var txtLabel2: UILabel!
    @IBOutlet weak var txtLabel1: UILabel!
    @IBOutlet weak var txtLabel: UILabel!
    var selectTimeViewController:SelectTimeViewController!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
