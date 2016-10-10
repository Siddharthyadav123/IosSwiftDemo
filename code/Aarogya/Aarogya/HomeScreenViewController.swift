//
//  HomeScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/8/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class HomeScreenViewController: BaseViewController, UITabBarDelegate {
    
    @IBOutlet weak var tabBarView: UITabBar!
    
    @IBOutlet weak var mainContainerView: UIView!
    
    @IBOutlet weak var knowLabelOutlet: UILabel!
    
    @IBOutlet weak var dotLabelOutlet: UILabel!
    
    @IBOutlet weak var tabItemOutlet: UITabBarItem!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var cancelImage: UIImageView!
    
    var setTag : Int!
    
    //declares all body view controllers here..
    var knowVC: KnowViewController!
    var findVC: FindViewController!
    var consultVC: ConsultViewController!
    var recordVC: RecordViewController!
    var profileSignUpVC: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllBodyViews()
        setUpNavBar()
        setAttributes()
        
        //        setTitle()
        //        setrightButton()
        //        setleftButton()
        //setBackgroundColor()
        
        // Do any additional setup after loading the view.
    }
    
    /*
    * Add all body views in one time only.
    */
    func addAllBodyViews(){
        knowVC = KnowViewController()
        addSubView(knowVC)
        
        findVC = FindViewController()
        addSubView(findVC)
        
        consultVC = ConsultViewController()
        
        consultVC.homeScreenViewController = self
        addSubView(consultVC)
        
        recordVC=RecordViewController()
        addSubView(recordVC)
        
        profileSignUpVC = ProfileViewController()
        addSubView(profileSignUpVC)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    /*
    * Set up navigation bar.
    */
    func setUpNavBar(){
        self.navigationController?.navigationBar.barTintColor = Utils.hexStringToUIColor("#00B0FF")
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        navigationItem.backBarButtonItem = backButton
        
        //sets the nav left & right button event.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: #selector(onLeftButtonClicked))
        
        let image = UIImage(named: "mark.png")
            navigationItem.rightBarButtonItem = UIBarButtonItem(image:image, style:UIBarButtonItemStyle.Plain, target: self, action: #selector(onRightButtonClicked))
        
    }
    
    
    
    /*
    * Bring header to the front.
    */
    func bringHeaderToFront(){
        parentView .bringSubviewToFront(headerView)
    }
    /*
    * Sets attributes to the views.
    */
    func setAttributes(){
        tabBarView.selectedItem = tabBarView.items![0] as? UITabBarItem
        tabBar(tabBarView, didSelectItem: tabBarView.items![0])
        setTagsToTabItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    * Set tags to the tab bar items.
    */
    func setTagsToTabItems(){
        var index:Int = 0
        for item in tabBarView.items!{
            item.tag = index
            index++
        }
    }
    
    
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("barItem: ",item)
        setTag = item.tag
        if item.tag==0{
            mainContainerView .bringSubviewToFront(knowVC.view)
            setNavBarTexts("Know", leftButtText: "Interests");
        }else if item.tag==1{
            mainContainerView .bringSubviewToFront(findVC.view)
            setNavBarTexts("Find & Book", leftButtText: "");
            
        }else if item.tag==2{
            mainContainerView .bringSubviewToFront(consultVC.view)
            setNavBarTexts("Consult", leftButtText: "My Queries");
            
        }else if item.tag==3{
            mainContainerView .bringSubviewToFront(recordVC.view)
            setNavBarTexts("Health Records", leftButtText: "");
            
            
        }else if item.tag==4{
            mainContainerView .bringSubviewToFront(profileSignUpVC.view)
            setNavBarTexts("Profile", leftButtText: "");
            
        }
    }
    
    /*
    * Add subview to the main content body.
    */
    func addSubView(viewController: UIViewController){

        addChildViewController(viewController)
        //self.webView.frame = self.view.bounds
        viewController.view.frame = mainContainerView.bounds;
        mainContainerView.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
    }
    
    func setNavBarTexts(title:String, leftButtText:String){
        
        self.title = title
        
        navigationItem.leftBarButtonItem?.title = leftButtText;
        

        
        //        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        //        self.navigationController?.navigationBar.barTintColor = Utils.hexStringToUIColor("#00c5ff")
    }
    
    
    /*
    *   On nav bar left button clicked.
    */
    func onLeftButtonClicked(){
        if setTag == 0{
            let healthInterestVC = HealthInterestViewController()
            self.presentViewController(healthInterestVC, animated: true, completion:nil)
            print("Interest Screen")
        }
        else if setTag == 1{
                print("Second screen")
        }
        else if setTag == 2{
               
                let myQUeriesViewController: MyQueriesScreenViewController = MyQueriesScreenViewController()
                self.navigationController!.pushViewController(myQUeriesViewController, animated: true)

            print("Third screen")
        }
            else if setTag == 3{
                print("Fourth screen")
        }
            else if setTag == 4{
                print("Fifth screen")
        }
    }
    
    
    /*
    *   On nav bar left button clicked.
    */
    func onRightButtonClicked(){
      
        
        if setTag == 0{
             self.ActionSheet()
             print("Interest Screen")
        }
        else
            if setTag == 1{
                 self.ActionSheet()
                print("Second screen")
            }
            else if setTag == 2{
                let filterViewController =  FilterViewController()
              self.navigationController?.pushViewController(filterViewController, animated: true)
                print("Third screen")
            }
            else if setTag == 3{
                 self.ActionSheet()
                print("Fourth screen")
            }
            else if setTag == 4{
                 self.ActionSheet()
                print("Fifth screen")
        }
    }
    
        
    
    @IBAction func cancelButton(sender: AnyObject) {
    }
    
        func ActionSheet(){
            
            
            let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .ActionSheet)
            
            // 2
            let ShareAction = UIAlertAction(title: "Share", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                
                let firstActivityItem = "Hey!!! you came to right place."
                let secondActivityItem : NSURL = NSURL(string: "")!
                // If you want to put an image
                let image : UIImage = UIImage(named: "share")!
                
                let activityViewController : UIActivityViewController = UIActivityViewController(
                    activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
                
                // This lines is for the popover you need to show in iPad
                //        activityViewController.popoverPresentationController?.sourceView = (sender as! UIBarButtonItem)
                
                // This line remove the arrow of the popover to show in iPad
                //        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.allZe
                
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
                
                
                
                //print("File Share")
            })
            let AboutUsAction = UIAlertAction(title: "About Us", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                //print("About us")
                let aboutUsViewController: AboutUsViewController = AboutUsViewController()
                
                self.presentViewController(aboutUsViewController, animated: true, completion: nil)
            })
            
            //
            let RateUsAction = UIAlertAction(title: "Rate Us", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                UIApplication.sharedApplication().openURL(NSURL(string : "http://iconmonstr.com/info-2/?png")!)
                //print("Rate us")
            })
            
            let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                
                //print("Rate us")
            })
            
            
            // 4
            optionMenu.addAction(ShareAction)
            optionMenu.addAction(AboutUsAction)
            optionMenu.addAction(RateUsAction)
            optionMenu.addAction(CancelAction)
            
            // 5
            self.presentViewController(optionMenu, animated: true, completion: nil)
            
    }

        }
        

