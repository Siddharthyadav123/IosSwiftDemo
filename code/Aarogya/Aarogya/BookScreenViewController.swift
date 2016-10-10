//
//  BookScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/2/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class BookScreenViewController: BaseViewController,UIPageViewControllerDataSource{
    
    
    var pageViewController : UIPageViewController?
    
    var checkIndex : Int!
    
    @IBOutlet weak var sliderView: UIView!
  
    @IBOutlet weak var dayAndDate: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     setAdapterToHomeScreenViewController()
         }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func setAdapterToHomeScreenViewController(){
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.view.frame = CGRectMake(0, 0, sliderView.frame.size.width, sliderView.frame.size.height)
        
        let selecTimeVC:SelectTimeViewController = viewControllerAtIndex(0)!
        let viewControllers = [selecTimeVC]
        
        pageViewController!.setViewControllers(viewControllers  , direction: .Forward, animated: false, completion: nil)
        addChildViewController(pageViewController!)
        sliderView.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! SelectTimeViewController).Pageindex
        if (index == 0) {
            return nil
        }
        
        index = index - 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! SelectTimeViewController).Pageindex
        // checkIndex = index
        print("after method \(index)")
        
        if index == 7 {
            return nil
            
        }
        index = index + 1
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> SelectTimeViewController?
    {
        
        let selecTimeVC:SelectTimeViewController = SelectTimeViewController(nibName:"SelectTimeViewController", bundle: nil)
        
        selecTimeVC.Pageindex = index
        checkIndex = selecTimeVC.Pageindex
        print(checkIndex)
        return selecTimeVC
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    

}





