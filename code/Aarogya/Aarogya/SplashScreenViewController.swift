//
//  SplashScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/7/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit
class SplashScreenViewController: BaseViewController {
    let SPLASH_DISPLAY_LENGTH=2
    
   
    
    override func viewDidLoad() {

        super.viewDidLoad()
    
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.setTimerToLaunchNextScreen()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}
    
    
   
    /*
    * Method to set Timer on Splash Screen to launch next screen (Login Screen).
    */
    func setTimerToLaunchNextScreen(){
        
        NSTimer.scheduledTimerWithTimeInterval(2, target:self,
            selector:Selector("launchNextScreen"),
            userInfo:nil,
            repeats:false)
        
    }
    
    
    func launchNextScreen()
    {
        
        let tutorialOnlyForFirstLaunch = TutorialOnlyForFirstLaunch()
        let isAppLaunch=tutorialOnlyForFirstLaunch.getValueFromPreferences("isAppAlreadyLaunchedOnce")
        
        
        if(!isAppLaunch){
            //False-> Application is launching fist time. SO launch tutorial screen
            let tutorialVC:TutorialViewController = TutorialViewController(nibName:"TutorialViewController", bundle: nil)
            self.presentViewController(tutorialVC, animated: true, completion: nil)
            print(" Application is launching fist time. SO launch tutorial screen")
            
        }
        else{
            //True-> Application is already launched . SO launch HomeScreenViewController
            
            let homeScreenViewController=HomeScreenViewController(nibName:"HomeScreenViewController",bundle:nil)
            let navController = UINavigationController(rootViewController: homeScreenViewController)
            self.presentViewController(navController, animated: true, completion: nil)
            print("Application is already launched . SO launch HomeScreenViewController")
        }
        
    }
    

    
}





