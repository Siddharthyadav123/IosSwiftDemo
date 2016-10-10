//
//  ConsultTableViewCell.swift
//  Aarogya
//
//  Created by ranjit singh on 4/13/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ConsultTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var imageViewOutlet: UIView!
    var consultViewController: ConsultViewController!

    @IBOutlet weak var itLooksLabel: UILabel!
    @IBOutlet weak var skinAllergyLabel: UILabel!
   
}
