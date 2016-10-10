//
//  EditProfileViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/26/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class EditProfileViewController: BaseViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    /*
    * for editing Date
    */
    let dateFormatter = NSDateFormatter()
    

    /*
    * for editing profile picture
    */
    let imagePicker = UIImagePickerController()
    
    
    /*
    * DAta for Blood Group
    */
    var pickerdata = ["Select Group", "A+", "A-","B+","B-","AB+","AB-","O+","O-"]
    
    @IBOutlet weak var reminderViewContainer: UIView!
   
    /*
    *   Outlet Picker View
    */
    @IBOutlet weak var pickerView: UIPickerView!
    
    /*
    * Outlet Image View of Button
    */
    @IBOutlet weak var imageViewContainer: UIImageView!
    
    /*
    * Outlet BloodGroup  Button
    */
    @IBOutlet weak var chooseBloodGroupButton: UIButton!
    
    @IBOutlet weak var mobileNumberButton: UIButton!
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    
    @IBOutlet weak var chooseBlood: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var dateViewContainer: UIView!
    
    @IBOutlet weak var dateBithday: UILabel!
    
    @IBOutlet weak var pickerViewContainer: UIView!
    
    @IBOutlet weak var dateImageViewContainer: UIImageView!
    
    @IBOutlet weak var dateChangeButton: UIButton!
    
    @IBOutlet weak var tableViewContainer: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var editProfileButton: UIButton!
    
    @IBOutlet weak var imageButtonimage: UIImageView!
   
    @IBOutlet weak var checkedFemaleImage: UIImageView!
    
    @IBOutlet weak var checkedMaleImage: UIImageView!
    
    
    
    /*
    * Action of Done  Button
    */
    @IBAction func doneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    * Action of BloodGroup  Button
    */
    @IBAction func ChosseBloodGroupButton(sender: AnyObject) {
        pickerView.hidden = false
        pickerViewContainer.hidden = false
    }
    
    /*
    * Action of maleButton  Button
    */
    @IBAction func maleButton(sender: AnyObject) {
        checkedFemaleImage.hidden = true
        checkedMaleImage.hidden = false
    }
    
    
    
    /*
    * Action of femaleButton  Button
    */
    @IBAction func femaleButton(sender: AnyObject) {
        checkedFemaleImage.hidden = false
        checkedMaleImage.hidden = true
    }
    
    /*
    * Action of healthinterestButton
    */
    @IBAction func healthinterestButton(sender: AnyObject) {
        
        let healthInterestVC = HealthInterestViewController()
        self.presentViewController(healthInterestVC, animated: true, completion:nil)
    }
    
    
    /*
    * Action of mobileNumberButton
    */
    @IBAction func mobileNumberButton(sender: AnyObject) {
        
        let mobileNumberVC = MobileNumberViewController()
        self.presentViewController(mobileNumberVC, animated: true, completion:nil)
    }
    
    /*
    * Action of closeButton
    */
    @IBAction func closeButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    *  Button for editing profile picture
    */
    @IBAction func editProfileButton(sender: AnyObject) {
        editProfile()
    }
    
    /*
    *  Button for Select City
    */
    @IBAction func cityButton(sender: AnyObject) {
        
        let selectCityVC = SelectCityViewController()
        self.presentViewController(selectCityVC, animated: true, completion: nil)
    }
    
    /*
    *  Button for changing Birthday date
    */
    @IBAction func dateChangeButton(sender: AnyObject) {
        
        dateViewContainer.hidden = false
        datePickerView.hidden = false
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(datePickerView.date)
        self.dateBithday.text = strDate
    }

    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.userInput.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
        dateViewContainer.hidden = true
        checkedFemaleImage.hidden = true
            reminderViewContainer.hidden = true
        
        /*
        * for editing profile picture
        */
        imagePicker.delegate = self
        
            
        /*
        *To hide Picker View as Screen Launch
        */
        pickerViewContainer.hidden = true
        
        /*
        * Tap Gesture to ImageViewCOntainer
        */
        let imageView = imageViewContainer
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        /*
        * Tap Gesture to DateImageViewCOntainer
        */
        let dateimageView = dateImageViewContainer
        let tapGestureRecognizerdate = UITapGestureRecognizer(target:self, action:Selector("imageTap:"))
        dateimageView.userInteractionEnabled = true
        dateimageView.addGestureRecognizer(tapGestureRecognizerdate)
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
          }
    
    
    /*
    * This Method is for scroll View
    */
        override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollViewContainer.contentSize = CGSizeMake(320,520)
        scrollViewContainer.contentInset = UIEdgeInsetsMake(0, 0, 70, 0)
    }
    
    
    /*
    *  This method is for keyboard
    */
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    /*
    * Method of Tap Gesture to DateImageViewCOntainer
    */
    func imageTap(sender: UITapGestureRecognizer){
        dateViewContainer.hidden = true
    }
    
    
    
    /*
    * Method of Tap Gesture to ImageViewCOntainer
    */
    func imageTapped(sender: UITapGestureRecognizer){
        pickerViewContainer.hidden = true
    }
    
    
    /*
    *  This method is for keyboard dismiss on return key
    */
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /*
    *  DataSource of picker VIew
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerdata.count
    }
    
    
    
    /*
    *  Delegates of picker VIew
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerdata[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.chooseBlood.text = pickerdata[row]
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickerView.hidden = false
        return false
    }
    
    
    /*
    * Method for editing profile picture
    */
    
    func editProfile(){
        let optionMenu = UIAlertController(title: nil, message: "", preferredStyle: .ActionSheet)
        
        // 2
        let ChoosePhoto = UIAlertAction(title: "Choose Photo", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
            print("from library")
            //shows the photo library
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .PhotoLibrary
            self.imagePicker.modalPresentationStyle = .Popover
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        })
        
        let TakePhoto = UIAlertAction(title: "Take Photo", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("take a photo")
            //shows the camera
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .Camera
            self.imagePicker.modalPresentationStyle = .Popover
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        })
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        optionMenu.addAction(ChoosePhoto)
        optionMenu.addAction(TakePhoto)
        optionMenu.addAction(CancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("finished picking image")
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //handle media here i.e. do stuff with photo
        
        print("imagePickerController called")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageButtonimage.image = chosenImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //what happens when you cancel
        //which, in our case, is just to get rid of the photo picker which pops up
        dismissViewControllerAnimated(true, completion: nil)
    }
       
}

