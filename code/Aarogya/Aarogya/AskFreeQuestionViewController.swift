//
//  AskFreeQuestionViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/19/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class AskFreeQuestionViewController: BaseViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
     let selectSpecialityVC = SelectSpecialityViewController()
    
    @IBOutlet weak var closeImageButton: UIImageView!
   
    @IBAction func closeImageButton(sender: AnyObject) {
        self.termsAndConditionsViewContainer.frame = CGRectMake(0, 393, 320, 58)
        self.imagePlacingView.hidden = true
        imageToBePlaced.image = nil
    }
    
    @IBAction func checkBoxButton(sender: AnyObject) {
        if unCheckedImage.hidden == false{
            self.checkBoxImage.hidden = false
            self.unCheckedImage.hidden = true
        }
        else if unCheckedImage.hidden == true
        {
            self.checkBoxImage.hidden = true
            self.unCheckedImage.hidden = false
        }
    }
    
      @IBOutlet weak var emailTextView: UIView!
    
    @IBOutlet weak var dataDisplay: UILabel!
    
    @IBOutlet weak var displaySelectedData: UILabel!
    
    @IBOutlet weak var termsAndConditionsViewContainer: UIView!
    
    @IBOutlet weak var alertMailValidate: UILabel!
    
    @IBOutlet weak var selectSpeciality: UILabel!
   
    
    @IBOutlet weak var alertCharCount: UILabel!
    
    @IBOutlet weak var alertTxtCount: UILabel!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var unCheckedImage: UIImageView!
    
    @IBOutlet weak var describeTextView: UITextView!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    @IBOutlet weak var countofCharacters: UILabel!
    
    @IBOutlet weak var imagePlacingView: UIView!
    
    @IBOutlet weak var countofLetters: UILabel!
    
    @IBOutlet weak var problemTypeText: UITextField!
    
    @IBOutlet weak var imageToBePlaced: UIImageView!
    
    @IBOutlet weak var imageToBePlaced1: UIImageView!
    
    @IBOutlet weak var ScrollViewContainer: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let imagePicker = UIImagePickerController()
    
    var customAlertViewController = CustomAlertViewController()
    
    
    //Button Action for textAlertButton
    @IBAction func textAlertButton(sender: AnyObject) {
        let alert = UIAlertView()
        alert.title = "Sorry!"
        alert.message = "Please enter gender and age  first!"
        alert.addButtonWithTitle("Okay")
        alert.show()
    }
    
    //Button Action for nextImageButton
    @IBAction func nextImageButton(sender: AnyObject) {
        self.editProfile()
        self.editNextProfilePic()
    }
    
    //Button Action for whomareyouaskingButton
    @IBAction func whomareyouaskingButton(sender: AnyObject) {
        self.presentViewController(customAlertViewController, animated: true, completion: nil)
    }
    
    //Button Action for ImageButton
    @IBAction func imageButton(sender: AnyObject) {
        self.imagePlacingView.hidden = false
        self.termsAndConditionsViewContainer.frame = CGRectMake(0, 454, 320, 58)
        self.editProfile()
        
       
       
        
    }
    
    //Button Action for backButton
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Button Action for termsCondiButton
    @IBAction func termsCondiButton(sender: AnyObject) {
        let termsandConditionsVC = TermsandConditionScreenViewController ()
        self.presentViewController(termsandConditionsVC, animated: true, completion: nil)
    }
    
    //Button Action for selectSpecialityButtons
    @IBAction func selectSpecialityButtons(sender: AnyObject) {
//        let selectSpecialityVC = SelectSpecialityViewController()
        // self.navigationController?.pushViewController(selectSpecialityVC, animated: true)
        self.presentViewController(selectSpecialityVC, animated: true, completion: nil)
    }
    
    //Button Action for askADoctorButton
    @IBAction func askADoctorButton(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.problemTypeText.delegate = self
        self.imagePlacingView.hidden = true
        self.checkBoxImage.hidden = true
        self.unCheckedImage.hidden = false
        self.textFieldShouldMove()
        self.textAppearsOnLabel()
        
        
        /*
        * for editing profile picture
        */
        imagePicker.delegate = self
        self.termsAndConditionsViewContainer.frame = CGRectMake(0, 393, 320, 58)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSizeMake(320, 590)
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.ScrollViewContainer.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.displaySelectedData.text = CustomAlert.customInstance.displayMessage
        // self.displaySelectedData.text = CustomAlert.customInstance.displayGender
        // self.displaySelectedData.text = CustomAlert.customInstance.dispalyAge
        
        //self.displaySelectedData.text = "Whom are you asking for?"
        if customAlertViewController.DisplayData == nil{
            print("In ViewWillAppear")
            self.displaySelectedData.textColor = UIColor.lightGrayColor()
            self.displaySelectedData.font = displaySelectedData.font.fontWithSize(13)
            self.displaySelectedData.text = "Whom are you asking for?"
        }
        else {
            self.displaySelectedData.textColor = UIColor.blackColor()
            self.displaySelectedData.font = displaySelectedData.font.fontWithSize(15)
            self.displaySelectedData.text = customAlertViewController.DisplayData
            
        }
        
        if selectSpecialityVC.valueOfSpeciality == nil{
            selectSpeciality.textColor = UIColor.lightGrayColor()
            self.selectSpeciality.font = selectSpeciality.font.fontWithSize(13)
            self.selectSpeciality.text = "select Speciality"
        }
        else {
             self.selectSpeciality.textColor = UIColor.blackColor()
            self.selectSpeciality.font = selectSpeciality.font.fontWithSize(15)
            selectSpeciality.text = selectSpecialityVC.valueOfSpeciality
        }
        
        }

    
    func textAppearsOnLabel(){
        if displaySelectedData.text == nil{
            print("In ViewDidLoad")
            self.displaySelectedData.textColor = UIColor.lightGrayColor()
            self.displaySelectedData.font = displaySelectedData.font.fontWithSize(13)
            self.displaySelectedData.text = "Whom are you asking for?"
        }
        else {
            self.displaySelectedData.textColor = UIColor.blackColor()
            self.displaySelectedData.font = displaySelectedData.font.fontWithSize(15)
            self.displaySelectedData.text = customAlertViewController.DisplayData
            
        }

    }
    
    func textFieldShouldMove(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
//    /*
//    *  This method is for keyboard dismiss on return key
//    */
//    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
//    {
//        textField.resignFirstResponder()
//        
//        return true
//    }
    
    
    func editProfile(){
        
        self.imagePlacingView.hidden = false
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .ActionSheet)
        
        // 2
        
        
        let TakePhoto = UIAlertAction(title: "Take a Photo", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("take a photo")
            //shows the camera
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .Camera
            self.imagePicker.modalPresentationStyle = .Popover
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        })
        
        let ChoosePhoto = UIAlertAction(title: "Choose from Photo gallery", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
            print("from library")
            //shows the photo library
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .PhotoLibrary
            self.imagePicker.modalPresentationStyle = .Popover
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        })
        
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            self.imagePlacingView.hidden = true
            self.termsAndConditionsViewContainer.frame = CGRectMake(0, 393, 320, 58)
            
        })
        
        optionMenu.addAction(TakePhoto)
        optionMenu.addAction(ChoosePhoto)
        optionMenu.addAction(CancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //handle media here i.e. do stuff with photo
        
        print("imagePickerController called")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageToBePlaced.image = chosenImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //what happens when you cancel
        //which, in our case, is just to get rid of the photo picker which pops up
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        
        //change the value of the label
        
        countofLetters.text =  String(newLength)
        
        //you can save this value to a global var
        //myCounter = newLength
        //return true to allow the change, if you want to limit the number of characters in the text field use something like
        
        return newLength <= 24 // To just allow up to 25 characters
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        // remove the placeholder text when they start typing
        // first, see if the field is empty
        // if it's not empty, then the text should be black and not italic
        // BUT, we also need to remove the placeholder text if that's the only text
        
        
        let newLength = textView.text.utf16.count + text.utf16.count - range.length
        countofCharacters.text =  String(newLength)
        return newLength <= 319 // have text, so don't show the placeholder
        
    }
    
    func validateEmail(emailTxt:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluateWithObject(emailTxt)
        
    }
    
    func editNextProfilePic(){
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            //handle media here i.e. do stuff with photo
            
            print("imagePickerController called")
            
            let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            imageToBePlaced1.image = chosenImage
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            //what happens when you cancel
            //which, in our case, is just to get rid of the photo picker which pops up
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    /*
    * Method fro KeyBoardWillShow
    */
    func keyboardWillShow(sender: NSNotification) {
        self.ScrollViewContainer.frame.origin.y -= 25
    }
    
    /*
    * Method fro KeyBoardWillHide
    */
    func keyboardWillHide(sender: NSNotification) {
        self.ScrollViewContainer.frame.origin.y += 25
    }
    
}



