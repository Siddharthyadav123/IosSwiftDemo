//
//  DoctorsProfileViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/19/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class DoctorsProfileViewController: BaseViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var mainContainerView: UIView!
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var parentView: UIView!
 
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButton(sender: AnyObject) {
       //let doctorsProfileVC: DoctorsProfileViewController = DoctorsProfileViewController!()
        
        self.navigationController!.popViewControllerAnimated(true)

    }
    @IBOutlet weak var menupopupButton: UIButton!
    @IBAction func menupopupButton(sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .ActionSheet)
        let ShareAction = UIAlertAction(title: "Share", style: .Default, handler:
            
            {
                (alert: UIAlertAction!) -> Void in
                
                let firstActivityItem = "Hey!!! you came to right place."
                let secondActivityItem : NSURL = NSURL(string: "")!
                // If you want to put an image
                let image : UIImage = UIImage(named: "share")!
                
                let activityViewController : UIActivityViewController = UIActivityViewController(
                    activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
                
                
                activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
                
                // Anything you want to exclude
                activityViewController.excludedActivityTypes = [
                    UIActivityTypePostToWeibo,
                    UIActivityTypePrint,
                    UIActivityTypeAssignToContact,
                    UIActivityTypeSaveToCameraRoll,
                    UIActivityTypeAddToReadingList,
                    UIActivityTypePostToFlickr,
                    UIActivityTypePostToVimeo,
                    UIActivityTypePostToTencentWeibo
                ]
                
                self.presentViewController(activityViewController, animated: true, completion: nil)
                
                
                
        })
        
        let Reportaproblem = UIAlertAction(title: "Report a problem ", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
        })
        
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        
        optionMenu.addAction(Reportaproblem)
        
        optionMenu.addAction(CancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }

    @IBOutlet weak var bottomButtonView: UIView!
    
    @IBOutlet weak var bookButton: UIButton!
    @IBAction func bookButton(sender: AnyObject) {
        
    }
   
    
 
    var minScrollingOffset: CGFloat!
    
    var navBarAlpha:CGFloat = 0.0
    
    override func viewDidLoad() {
       // print("viewDidLoad")
        
        super.viewDidLoad()
        setAttributes()
        loadSubView()
        
        
    }
    
    /*
    * Sets attributes to the view.
    */
    func setAttributes(){
        scrollview.contentSize = CGSizeMake(320, parentView.bounds.size.height+100);
        self.navigationController?.navigationBar.alpha = 0.0
        self.title = "Dr. Harish Rathi"
        let image = UIImage(named: "interface-2.png")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:image, style:UIBarButtonItemStyle.Plain, target: self, action: "onRightButtonClicked")
    }
    
    
    override func viewWillLayoutSubviews() {
       // print("viewWillLayoutSubviews")
        
    }
    override func viewDidAppear(animated: Bool) {
        //print("viewDidAppear")
        //        self.navigationController?.navigationBar.alpha = navBarAlpha
        
        //        scrollview.contentInset = UIEdgeInsetsMake(150, 0.0, 0.0, 0.0)
        
    }
    override func viewWillAppear(animated: Bool) {
        //print("viewWillAppear")
        self.navigationController?.navigationBar.alpha = navBarAlpha
        
    }
    func loadSubView(){
        let doctorProfileInfo:DoctorProfileInfoView  = DoctorProfileInfoView(frame:CGRectMake(0, 0, 320, 768))
        doctorProfileInfo.sizeToFit()
        self.parentView .addSubview(doctorProfileInfo)
        doctorProfileInfo.doctorsProfileVC=self
        mainContainerView.bringSubviewToFront(headerView)
        mainContainerView.bringSubviewToFront(bottomButtonView)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //print("viewDidLayoutSubviews")
        
        
        scrollview.delegate = self
        scrollview.contentInset = UIEdgeInsetsMake(containerView.bounds.size.height, 0.0, 0.0, 0.0)
        scrollview.scrollRectToVisible(CGRectMake(0, 0, 1, 1), animated: false)
        minScrollingOffset = -(parentView.bounds.size.height - view.bounds.size.height)
        
        
        
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollOffset: CGFloat = -scrollView.contentOffset.y
        let yPos: CGFloat = (scrollOffset - containerView.bounds.size.height)
        let paralexedYPos:CGFloat =  yPos*0.3
        
        //        print("scrollOffset: \(scrollOffset), yPos: \(yPos), containerHeight: \(containerView.bounds.size.height)")
        //        (scrollOffset>=minScrollingOffset)
        if(scrollOffset>=0 && scrollOffset<=containerView.frame.size.height){
            // scroll offset should in between 0 and image container height.
            //            print("scrollOffset: \(scrollOffset), yPos: \(yPos), containerHeight: \(containerView.bounds.size.height)")
            
            self.containerView.frame = CGRectMake(0, paralexedYPos, containerView.frame.size.width, containerView.frame.size.height)
            let alpha: CGFloat = 1.0 - (-yPos / containerView.frame.size.height)
            
            scrollview.contentInset = UIEdgeInsetsMake(scrollOffset, 0.0, 0.0, 0.0)
            
            self.imageView.alpha = alpha
            //            let fontSize: CGFloat = 24 - (-yPos / 20)
            
            self.navigationController?.navigationBar.alpha = getNavBarAlpha(scrollOffset)
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        //print("viewDidDisappear")
        
    }
    
    override func viewWillDisappear(animated: Bool) {
       // print("viewDidDisappear")
        navBarAlpha = 1
        self.navigationController?.navigationBar.alpha = navBarAlpha
        
    }
    /*
    * Gets the navbar alph value based on formulae.
    * 1- ((1/maxOffset)* currentOffset)
    */
    func getNavBarAlpha(offset:CGFloat) -> CGFloat{
        let tempAlpha: CGFloat = (1/containerView.frame.size.height)*offset
        let finalAlpha:CGFloat = (1-tempAlpha)
        //        print("NavBarAlpha: \(navBarAlpha)")
        return finalAlpha;
    }
    
    func onRightButtonClicked(){
        
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .ActionSheet)
      let ShareAction = UIAlertAction(title: "Share", style: .Default, handler:
            {
            (alert: UIAlertAction!) -> Void in
            
            let firstActivityItem = "Hey!!! you came to right place."
            let secondActivityItem : NSURL = NSURL(string: "")!
            // If you want to put an image
            let image : UIImage = UIImage(named: "share")!
            
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)

            
            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
            
            // Anything you want to exclude
            activityViewController.excludedActivityTypes = [
                UIActivityTypePostToWeibo,
                UIActivityTypePrint,
                UIActivityTypeAssignToContact,
                UIActivityTypeSaveToCameraRoll,
                UIActivityTypeAddToReadingList,
                UIActivityTypePostToFlickr,
                UIActivityTypePostToVimeo,
                UIActivityTypePostToTencentWeibo
            ]
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
            
            

        })
        let Reportaproblem = UIAlertAction(title: "Report a problem ", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
    
            
        })
        
                
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
                    })
        

        optionMenu.addAction(Reportaproblem)
      
        optionMenu.addAction(CancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    

}