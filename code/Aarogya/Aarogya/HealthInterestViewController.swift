//
//  HealthInterestViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/27/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class HealthInterestViewController: BaseViewController,UIScrollViewDelegate {
    
    /*
    * For fitness Button Action
    */
    @IBAction func fitnessButton(sender: AnyObject) {
        updateButtonState(fitnessButton)
    }
    
    
    /*
    * For sexualhealth Button Action
    */
    @IBAction func sexualhealthButton(sender: AnyObject) {
        updateButtonState(sexualhealthButton)
        
    }
    
    
    /*
    * For manageStress Button Action
    */
    @IBAction func manageStressButton(sender: AnyObject) {
        updateButtonState(manageStressButton)
    }
    
    
    
    /*
    * For weightLoss Button Action
    */
    @IBAction func weightLossButton(sender: AnyObject) {
        updateButtonState(weightLossButton)
    }
    
    
    /*
    * For nutrition Button Action
    */
    @IBAction func nutritionButton(sender: AnyObject) {
        updateButtonState(nutritionButton)
    }
    
    
    /*
    * For healthyHair Button Action
    */
    @IBAction func healthyHairButton(sender: AnyObject) {
        updateButtonState(healthyHairButton)
    }
    
    
    /*
    * For mentalWellBeing Button Action
    */
    @IBAction func mentalWellBiengButton(sender: AnyObject) {
        updateButtonState(mentalWellBeingButton)
        
    }
    
    /*
    * For skinCareButton  Action
    */
    @IBAction func skinCareButton(sender: AnyObject) {
        updateButtonState(skinCareButton)
    }
    
    /*
    * For healthyTeethButton Action
    */
    @IBAction func healthyTeethButton(sender: AnyObject) {
        updateButtonState(healthyTeethButton)
    }
    
    /*
    * For backPainButton Action
    */
    @IBAction func backPainButton(sender: AnyObject) {
        updateButtonState(backPain)
    }
    
    /*
    * For diabetesButton Button Action
    */    @IBAction func diabetesButton(sender: AnyObject) {
        updateButtonState(diabetesButton)
    }
    
    /*
    * For healthyimmunityButton Action
    */
    @IBAction func healthyimmunityButton(sender: AnyObject) {
        updateButtonState(healthimmunityButton)
    }
    
    /*
    * For eyeCareButton Button Action
    */
    @IBAction func eyeCareButton(sender: AnyObject) {
        updateButtonState(eyeCareButton)
    }
    
    /*
    * For healthyHeartButton Button Action
    */
    @IBAction func healthyHeartButton(sender: AnyObject) {
        updateButtonState(healthyHeartButton)
    }
    
    
    /*
    * For kidsHealthButton Button Action
    */    @IBAction func kidsHealthButton(sender: AnyObject) {
        updateButtonState(kidsHealthButton)
    }
    
    
    /*
    * For womenHealthButton Button Action
    */
    @IBAction func womenHealthButton(sender: AnyObject) {
        updateButtonState(womensHealthButton)
    }
    
    /*
    * For cancerButton Button Action
    */
    @IBAction func cancerButton(sender: AnyObject) {
        updateButtonState(cancerButton)
    }
    
    /*
    * For DigestiveButtonButton Action
    */    @IBAction func DigestiveButton(sender: AnyObject) {
        updateButtonState(digestiveButton)
    }
    
    /*
    * For Done Button Action    
    */
    @IBAction func DoneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    /*
    * For Cancel Button IBAction
    */
    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    /*
    *      IBOutlets for  Button
    */
    @IBOutlet weak var fitnessButton: UIButton!
    
    @IBOutlet weak var sexualhealthButton: UIButton!
    
    @IBOutlet weak var manageStressButton: UIButton!
    
    @IBOutlet weak var weightLossButton: UIButton!
    
    @IBOutlet weak var nutritionButton: UIButton!
    
    @IBOutlet weak var healthyHairButton: UIButton!
    
    @IBOutlet weak var mentalWellBeingButton: UIButton!
    
    @IBOutlet weak var skinCareButton: UIButton!
    
    @IBOutlet weak var healthyTeethButton: UIButton!
    
    @IBOutlet weak var backPain: UIButton!
    
    @IBOutlet weak var diabetesButton: UIButton!
    
    @IBOutlet weak var healthimmunityButton: UIButton!
    
    @IBOutlet weak var cancerButton: UIButton!
    
    @IBOutlet weak var eyeCareButton: UIButton!
    
    @IBOutlet weak var healthyHeartButton: UIButton!
    
    @IBOutlet weak var kidsHealthButton: UIButton!
    
    @IBOutlet weak var digestiveButton: UIButton!
    
    @IBOutlet weak var womensHealthButton: UIButton!
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAttribute()
        Utils.hexStringToUIColor("#00abff")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
    * This Method is for scroll View
    */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollViewContainer.contentSize = CGSizeMake(320,706)
        scrollViewContainer.contentInset = UIEdgeInsetsMake(0, 0, 70, 0)
        
    }
    
    /*
    * Method to apply round border to buttons
    */
    
    func buttonAttribute(){
        Utils.applyBorderToButtons(fitnessButton)
        Utils.applyBorderToButtons(sexualhealthButton)
        Utils.applyBorderToButtons(manageStressButton)
        Utils.applyBorderToButtons(weightLossButton)
        Utils.applyBorderToButtons(nutritionButton)
        Utils.applyBorderToButtons(healthyHairButton)
        Utils.applyBorderToButtons(mentalWellBeingButton)
        Utils.applyBorderToButtons(skinCareButton)
        Utils.applyBorderToButtons(healthyTeethButton)
        Utils.applyBorderToButtons(backPain)
        Utils.applyBorderToButtons(diabetesButton)
        Utils.applyBorderToButtons(healthimmunityButton)
        Utils.applyBorderToButtons(cancerButton)
        Utils.applyBorderToButtons(eyeCareButton)
        Utils.applyBorderToButtons(healthyHeartButton)
        Utils.applyBorderToButtons(kidsHealthButton)
        Utils.applyBorderToButtons(womensHealthButton)
        Utils.applyBorderToButtons(digestiveButton)
        
        
    }
    
    /*
    * Update the button state reverse of current state.
    */
    func updateButtonState(button: UIButton){
        let buttState = button.tag
        if buttState == 0{
            //button needs to be selected.
            button.backgroundColor = Utils.hexStringToUIColor("#00abff")
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.tag = 1
        }else{
            //button needs to be deselected.
            button.backgroundColor = UIColor.whiteColor()
            button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            button.tag = 0
        }
    }
  }

