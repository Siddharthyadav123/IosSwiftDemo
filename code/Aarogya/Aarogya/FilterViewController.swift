//
//  FilterViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/31/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class FilterViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource{
    
    var previousClick: NSIndexPath!
    var currentClick : Int!
    
    
    @IBAction func applyButton(sender: AnyObject) {
        
    }

     var data=["Allergist/Immunologist","Alternative Medicine","Audiologist","Ayurveda","Cardiologist","Dentist","Dermatologist/Cosmetologist","Dietitian/Nutrition","Ear-Nose-Throat(ENT)Specialist","Emergency & Critical Care","Endocrinologist","Gastroentrologist","General physian","Genetic","Gynecologist/Obstetrician","Homeopathy","Nephrologist","Neurologist","Nephrologist","Orthopedist","Pediatrician","Radiologist","Somnologist","Spa","Urologist","Veterinarian"]
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        applyButton.hidden = true
        setAttributes()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setAttributes(){
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FilterIdentifier")
        self.tableView.tableFooterView = UIView()
        self.title = "Filter"
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("in didselectrowatindex")
        applyButton.hidden = false
        
        //==============*** clear Button  ***=======================//
        if self.currentClick  != nil {
            print("button disappears")
        }else
        {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "clear", style: .Plain, target: self, action: #selector(HomeScreenViewController.onRightButtonClicked))
        }
        
        //==============*** To select cell ***=======================//
        if self.previousClick != nil {
            self.tableView.cellForRowAtIndexPath(self.previousClick)?.accessoryType = .None
        }
        
        self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
        
        self.previousClick = indexPath
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
        //    return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterIdentifier", forIndexPath: indexPath) 
        //cell.textLabel?.text = "Doctors"
        cell.textLabel?.text = data[indexPath.row]
        return cell
        
    }
    
    func onRightButtonClicked(){
        self.tableView.cellForRowAtIndexPath(self.previousClick)?.accessoryType = .None
        print("reload")
    }
    
   
}
