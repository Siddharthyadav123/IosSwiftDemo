//
//  ListOfDoctorsTableViewCell.swift
//  Aarogya
//
//  Created by ranjit singh on 4/18/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ListOfDoctorsTableViewCell: UITableViewCell {
 var listOfDoctorsVC:ListOfDoctorsViewController!
    
    @IBOutlet weak var bookButton: UIButton!
    
    @IBOutlet weak var mainViewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAttributes()
      }
    
   
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    
    func setAttributes(){
        self.mainViewContainer.layer.cornerRadius = 2.0
        self.mainViewContainer.clipsToBounds = true
    }
    
    
    
    
    @IBAction func bookButton(sender: AnyObject) {
        //Launching Book & Call screen on respective tags
        if bookButton.tag == 2{
        let callVC = CallViewController()
        listOfDoctorsVC.navigationController?.pushViewController(callVC, animated: true)
    }
        else
        {
            let bookVC = BookScreenViewController()
            listOfDoctorsVC.navigationController?.pushViewController(bookVC, animated: true)
        }
   
    }
    
    
    
}
