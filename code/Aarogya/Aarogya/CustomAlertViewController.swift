//
//  CustomAlertViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/23/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class CustomAlertViewController: BaseViewController,UIScrollViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate{
    
    
    
    /*
     * Variables Globally Declared
     */
    var gender : String!
    
    var relation : String!
    
    var DisplayData : String!
    
    var  label : UILabel!
    
    var currentSelectedLabel : UILabel!
    
    
    
    /*
     * IBoutlet of All Labels, textfields & Buttons
     */
    @IBOutlet weak var someOneElseButton: UIButton!
    
    @IBOutlet weak var selfButton: UIButton!
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var selfRelationTxt: UILabel!
    
    @IBOutlet weak var enterRelationTxt: UITextField!
    
    @IBOutlet weak var femaleLabel: UILabel!
    
    @IBOutlet weak var maleLabel: UILabel!
    
    @IBOutlet weak var ageViewContainer: UIView!
    
    @IBOutlet weak var imageViewContainer: UIView!
    
    @IBOutlet weak var ageView: UIView!
    
    @IBOutlet weak var relationView: UIView!
    
    @IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var ageScrollView: UIScrollView!
    
    @IBOutlet weak var genderScrollView: UIScrollView!
    
    @IBOutlet weak var imageSelectedLabel: UILabel!
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    @IBOutlet weak var imageNotSelected: UIImageView!
    
    @IBOutlet weak var imageSelected: UIImageView!
    
    @IBOutlet weak var notSelectedImage: UIImageView!
    
    @IBOutlet weak var selectedlabel: UILabel!
    
    @IBOutlet weak var notSelectedlabel: UILabel!
    
    @IBOutlet weak var defaultSelectedLabel: UILabel!
    
    @IBOutlet weak var defaultselectedimage: UIImageView!
    
    @IBOutlet weak var imageNotSelectedLabel: UILabel!
    
    
    
    /*
     * Cross Button Action to dissmis VC
     */
    @IBAction func crossButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    /*
     * Done Button Action to display selected data in AskfreeVCy
     */
    @IBAction func doneButton(sender: AnyObject) {
        
        self.buttonClicked()
        //relation = self.enterRelationTxt.text
        self.dismissViewControllerAnimated(true, completion: nil)
        DisplayData = "Asking for \(relation) (\(gender) \(currentSelectedLabel.text!) yrs)"
        print(DisplayData)
        
//        if someOneElseButton.tag == 2{
//            if  enterRelationTxt.text != "" ||  currentSelectedLabel.text != ""  {
//                print("Not empty text")
//            }else
//            {
////                self.dismissViewControllerAnimated(true, completion: nil)
////                DisplayData = "Asking for \(relation) (\(gender) \(currentSelectedLabel.text!) yrs)"
////                print(DisplayData)
//                 print(" empty text")
//            }
//        } else
//        {
//             if  currentSelectedLabel.text  != "" {
//                print("Not empty currentSelectedLabel")
//            }
////            self.dismissViewControllerAnimated(true, completion: nil)
////            DisplayData = "Asking for \(relation) (\(gender) \(currentSelectedLabel.text!) yrs)"
////            print(DisplayData)
//             else{
//           print(" empty currentSelectedLabel")
//            }
//        }

        
        
        //        if (selfButton.tag == 1) {
        //            if  currentSelectedLabel != "" {
        //                let alert = UIAlertView()
        //                alert.title = "Sorry!"
        //                alert.message = "Please fill all fields!"
        //                alert.addButtonWithTitle("Okay")
        //                alert.show()
        //            }else {
        //
        //                print("in else")
        //            }
        //
        //
        //        }else
        //        {
        //        print("Hello")
        //        }
        //        else if(someOneElseButton.tag == 2){
        //
        //            if  enterRelationTxt.text == "" && currentSelectedLabel != "" {
        //
        //                print("i m in else if part")
        //                let alert = UIAlertView()
        //                alert.title = "Sorry!"
        //                alert.message = "Please fill all fields!"
        //                alert.addButtonWithTitle("Okay")
        //                alert.show()
        //            }
        //
        //
        //        }
        
    }
    
    
    
    /*
     * Female Button Action to select gender female
     */
    @IBAction func femaleButton(sender: AnyObject) {
        femaleLabel.textColor = Utils.hexStringToUIColor("#00abff")
        maleLabel.textColor = UIColor.grayColor()
        
        gender = "Female"
        print(gender)
        
        if maleLabel.textColor == UIColor.grayColor(){
            maleButton.frame = CGRectMake(22, 10, 81, 50)
            maleLabel.frame = CGRectMake(48, 12, 49, 38)
            
        }
        femaleButton.frame = CGRectMake(112, 7, 105, 55)
        femaleLabel.frame = CGRectMake(125, 17, 61, 31)
        
    }
    
    /*
     * male Button Action to select gender male
     */
    @IBAction func maleButton(sender: AnyObject) {
        
        maleLabel.textColor = Utils.hexStringToUIColor("#00abff")
        femaleLabel.textColor = UIColor.grayColor()
        
        gender = "Male"
        print(gender)
        
        if femaleLabel.textColor == UIColor.grayColor(){
            femaleButton.frame = CGRectMake(150, 7, 105, 55)
            femaleLabel.frame = CGRectMake(175, 17,  61, 31)
            
        }
        maleButton.frame = CGRectMake(112, 10, 81, 50)
        maleLabel.frame = CGRectMake(125, 12, 49, 38)
        
    }
    
    
    /*
     * selfImageButton Action to show self image
     */
    @IBAction func selfImageButton(sender: AnyObject) {
        self.selfRelationTxt.hidden = false
        self.enterRelationTxt.hidden = true
        self.imageNotSelected.hidden = true
        self.imageSelected.hidden = true
        self.selectedlabel.hidden = true
        self.imageNotSelectedLabel.hidden = true
        self.selfButton.tag = 1
        //        relation = "Self"
        //        print(relation)
        
    }
    
//    func  setButtonTag() {
//        
//        self.selfButton.tag = 1
//    }
    
    /*
     * someoneelseImageButton Action to show some one else image
     */
    @IBAction func someoneelseImageButton(sender: AnyObject) {
        self.selfRelationTxt.hidden = true
        self.enterRelationTxt.hidden = false
        self.imageSelected.hidden = false
        self.selectedlabel.hidden = false
        self.imageNotSelected.hidden = false
        self.imageNotSelectedLabel.hidden = false
        self.someOneElseButton.tag = 2
        
        
    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.hiddenImages()
        self.hiddenLabels()
        self.addHundredLables()
        Utils.hexStringToUIColor("#00abff")
        femaleButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.GenderValueDisplay()
        self.keyboardhide()
        self.dismissKeyboard()
        relation = "self"
        //self.setButtonTag()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageScrollView.delegate = self
        imageScrollView.scrollEnabled = true
        imageScrollView.contentSize = CGSizeMake(350, 121)
        genderScrollView.contentSize = CGSizeMake(350, 69)
        ageScrollView.contentSize = CGSizeMake(2600, 68)
        ageViewContainer.frame.size.width = 2600
    }
    
    func buttonClicked(){
        
        if (selfButton.tag == 1) {
            relation = "self"
        }
            
        else if (someOneElseButton.tag == 2 ){
            relation = self.enterRelationTxt.text
            
        }
    }
    
    
    
    
    
    //    /*
    //    *  Method to display selected data in anotherVC
    //    */
    //    override func viewWillAppear(animated: Bool) {
    //        super.viewWillAppear(animated)
    //        self.enterRelationTxt.text = CustomAlert.customInstance.displayMessage
    //        self.enterRelationTxt.becomeFirstResponder()
    //        self.gender = CustomAlert.customInstance.displayGender
    //        self.label.text = CustomAlert.customInstance.dispalyAge
    //
    //    }
    //
    //
    //
    //    /*
    //    *  Method to update selected data in anotherVC
    //    */
    //    func updateMessageAndDismiss() {
    //        CustomAlert.customInstance.displayMessage = self.enterRelationTxt.text!
    //        CustomAlert.customInstance.displayGender = self.gender!
    //        CustomAlert.customInstance.dispalyAge = self.label.text!
    //
    //        self.dismissViewControllerAnimated(true, completion: nil)
    //    }
    //
    
    /*
     *  Method to hide labels
     */
    func hiddenLabels()
    {
        
        self.selfRelationTxt.hidden = false
        self.enterRelationTxt.hidden = true
    }
    
    
    /*
     *  Method to hide Images
     */
    func hiddenImages()
    {
        self.imageNotSelected.hidden = true
        self.imageSelected.hidden = true
        self.selectedlabel.hidden = true
        self.imageNotSelectedLabel.hidden = true
    }
    
    
    
    /*
     *  Method to display relation Value
     */
    func GenderValueDisplay(){
        gender = "Female"
        print(gender)
        
    }
    
    
    
    /*
     *  Method to add Hundred Lable
     */
    func addHundredLables(){
        
        for (var i = 1; i <= 99; i += 1){
            label = UILabel()
            var x = 26*i
            label.frame = CGRectMake(CGFloat(x) , 10, 26, 26)
            label.text = "\(i)"
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.whiteColor()
            ageViewContainer.addSubview(label)
            label.userInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(CustomAlertViewController.tapFunction(_:)))
            label.addGestureRecognizer(tap)
            tap.delegate = self
            
        }
    }
    
    // Tap gesture Receive action CallBAck
    func tapFunction(sender:UITapGestureRecognizer) {
        // print("tap working")
        
        if let label = sender.view as? UILabel {
            label.textColor = Utils.hexStringToUIColor("#00abff")
            
            if currentSelectedLabel != nil{
                
                currentSelectedLabel.textColor = UIColor.blackColor()
            }
            
//            print(label.text!)
//            currentSelectedLabel!.text = label.text!
//            print(currentSelectedLabel)
            
            currentSelectedLabel = label
            print(currentSelectedLabel)
            
        }
        
    }
    
    //
    //    /*
    //    *  This method is for keyboard
    //    */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
     *  This method is for keyboard dismiss on return key
     */
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardhide(){
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomAlertViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
}






