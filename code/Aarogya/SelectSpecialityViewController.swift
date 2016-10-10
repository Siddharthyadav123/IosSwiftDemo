//
//  SelectSpecialityViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/20/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class SelectSpecialityViewController: BaseViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    
    var valueOfSpeciality : String!
    
    @IBOutlet weak var mainViewContainer: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    var data=["Alternative medicine","General Physian","Spa","Radiologist","Dentist","Gynecologist/Obstetrician","Dermatologist","Homeopath","Ayurveda","Audiologist","Cardiologist","Gastroenterologist","Neurologist","Ear-Nose-Throat(ENT)Specialist","Psychiatrist","General Physician","Physiotherapist","Pediatrician","Urologist","Orthopedist","Ophthalomologist","Dietitian/Nutritionist","Veterinarian"]
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        self.setAttributes()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAttributes(){
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "selectSpeciality")
        self.tableView.tableFooterView = UIView()
        self.title = "Select Speciality"
        self.navigationController?.navigationItem.backBarButtonItem?.title = "Back"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .Plain, target: self, action: "onRightButtonClicked")
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print((data[indexPath.row]))
        valueOfSpeciality = (data[indexPath.row])
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
        
        //    return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("selectSpeciality", forIndexPath: indexPath)
        //cell.textLabel?.text = "Doctors"
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            return dataString.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
        })
        // When there is no text, filteredData is the same as the original data
        if searchText.isEmpty {
            filteredData = data
        } else {
            // The user has entered text into the search box
            // Use the filter method to iterate over all items in the data array
            // For each item, return true if the item should be included and false if the
            // item should NOT be included
            filteredData = data.filter({(dataItem: String) -> Bool in
                // If dataItem matches the searchText, return true to include it
                if dataItem.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
                    return true
                } else {
                    return false
                }
            })
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }

//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        self.searchBar.showsCancelButton = true
//    }
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//        searchBar.text = ""
//        searchBar.resignFirstResponder()
//    }
    /*
    * To Disable Autorotation
    */
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
  
    
}
