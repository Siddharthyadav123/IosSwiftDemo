//
//  DoctorsInfoTableViewCell.swift
//  Aarogya
//
//  Created by ranjit singh on 4/11/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class DoctorsInfoTableViewCell: UITableViewCell {
    
    
    
    @IBAction func describtionButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var likeUnlikeButton: UIButton!
    
    @IBOutlet weak var doctorsImage: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var doctorsLabel: UILabel!
    
    @IBOutlet weak var shareImageView: UIImageView!
    
    @IBOutlet weak var commentImageView: UIImageView!
    
    @IBOutlet weak var medicalImageView: UIImageView!
    
    @IBOutlet weak var cellContainerView: UIView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var numberOfLike: UILabel!
    
    
    @IBOutlet weak var likeUnlikeIconView: UIImageView!
    
    var knowViewController: KnowViewController!
    
    
    @IBOutlet weak var likeIconView: UIImageView!
    
     var isLikeButtonClick : Bool! = nil
    
    //  @IBOutlet weak var likedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setAttributes()
        self.likeLabel.hidden = true
        self.numberOfLike.hidden = true
        isLikeButtonClick = false
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    /*
     * Sets attributes to the views.
     */
    func setAttributes(){
        self.cellContainerView.layer.cornerRadius = 2.0
        self.cellContainerView.clipsToBounds = true
        
    }
    
    @IBAction func likeButtonCilck(sender: AnyObject) {
        
        print("Button Position :", self.likeUnlikeButton.tag)
        
        //If like button is not yet clicked i.e False
        if (!isLikeButtonClick){
            self.likeUnlikeIconView.image = UIImage(named: "liked")!
           
            isLikeButtonClick = true
            self.likeLabel.hidden = false
            self.numberOfLike.hidden = false
        }
            
            //else i.e True
        else
        {self.likeUnlikeIconView.image = UIImage(named: "likes")!
            
            isLikeButtonClick = false
            self.likeLabel.hidden = true
            self.numberOfLike.hidden = true
        }
       
   
        
    }
    
    
    
    @IBAction func shareButtonClick(sender: AnyObject) {
        knowViewController.shareInfo()
    }
    
    
    @IBAction func commentButtonClick(sender: AnyObject) {
        
        let commentScreenVC = CommentScreenViewController ()
        knowViewController.navigationController?.pushViewController(commentScreenVC, animated: true)
        
    }
    
    
}

