//
//  TutorialViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/7/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class TutorialViewController: BaseViewController,UIPageViewControllerDataSource {
    
    var pageViewController : UIPageViewController?
    
    var checkIndex : Int!
    
    @IBOutlet weak var nextButtonTxt: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var startAndNextButtonTxt: UIButton!
    
    @IBOutlet weak var BottomView: UIView!
    
    @IBAction func onNextButtonClick(sender: AnyObject) {
        
        let homeScreenViewController=HomeScreenViewController(nibName:"HomeScreenViewController",bundle:nil)
        let navController = UINavigationController(rootViewController: homeScreenViewController)
        self.presentViewController(navController, animated: true, completion: nil)
        print("skip Button")
        
    }
    
    @IBAction func startButton(sender: AnyObject) {
//        let homeScreenViewController=HomeScreenViewController(nibName:"HomeScreenViewController",bundle:nil)
//        let navController = UINavigationController(rootViewController: homeScreenViewController)
//        self.presentViewController(navController, animated: true, completion: nil)
//        print("skip Button")

        
    }
    
    @IBAction func skipButton(sender: AnyObject) {
      
        let homeScreenViewController=HomeScreenViewController(nibName:"HomeScreenViewController",bundle:nil)
        let navController = UINavigationController(rootViewController: homeScreenViewController)
        self.presentViewController(navController, animated: true, completion: nil)
        print("skip Button")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAdapterToHomeScreenViewController()
        nextButtonTxt.setTitle("Next", forState: UIControlState.Normal)
        geDataFromPreferences()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setAdapterToHomeScreenViewController(){
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.view.frame = CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height)
        
        let tutorialScreenChildViewController:TutorialScreenChildViewController = viewControllerAtIndex(0)!
        let viewControllers = [tutorialScreenChildViewController]
        
        pageViewController!.setViewControllers(viewControllers  , direction: .Forward, animated: false, completion: nil)
        addChildViewController(pageViewController!)
        containerView.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! TutorialScreenChildViewController).Pageindex
        if (index == 0) {
            return nil
        }
        
        index = index - 1
       // nextButtonTxt.hidden = false
        //startAndNextButtonTxt.hidden = true
        nextButtonTxt.setTitle("Next", forState: UIControlState.Normal)
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! TutorialScreenChildViewController).Pageindex
//               checkIndex = index
        print("after method \(index)")
        
        if index == 3 {
           // startAndNextButtonTxt.hidden = false
            nextButtonTxt.setTitle("Start", forState: UIControlState.Normal)

            //startAndNextButtonTxt.setTitle("Start", forState: UIControlState.Normal)
            //nextButtonTxt.hidden = true
            return nil
            
        }
        index = index + 1
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> TutorialScreenChildViewController?
    {
        
        let tutorialScreenChildVC:TutorialScreenChildViewController = TutorialScreenChildViewController(nibName:"TutorialScreenChildViewController", bundle: nil)
        
        tutorialScreenChildVC.Pageindex = index
        checkIndex = tutorialScreenChildVC.Pageindex
        print(checkIndex)
        return tutorialScreenChildVC
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    func geDataFromPreferences(){
        let tutorialOnlyForFirstLaunch = TutorialOnlyForFirstLaunch()
        //isAppAlreadyLaunchedOnce"
        tutorialOnlyForFirstLaunch.setValueInPreferences(true, key: "isAppAlreadyLaunchedOnce")
        
    }
}
