//
//  FindandBookViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/18/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class FindandBookViewController: BaseViewController ,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    
    var data=["Dentist","Gynecologist/Obstetrician","Dermatologist","Homeopath","Ayurveda","Cardiologist","Gastroenterologist","Neurologist","Ear-Nose-Throat(ENT)Specialist","Psychiatrist","General Physician","Physiotherapist","Pediatrician","Urologist","Orthopedist","Ophthalomologist","Dietitian/Nutritionist"]
    
    var dataimage=["Dentist","Gynec","Gynec","Homeo","Ayur","Cradio","Gas","Gynec","Geneal","Gynec","Geneal","Opht","Gas","Uro","medi","Opht","Diet"]
    var filteredData: [String]!


    @IBOutlet weak var mainViewContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "findAndBook")
        self.tableView.tableFooterView = UIView()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
        
        //    return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("findAndBook", forIndexPath: indexPath) as! UITableViewCell
        //cell.textLabel?.text = "Doctors"
        cell.textLabel?.text = filteredData[indexPath.row]
        
        
        let imageName = UIImage(named: dataimage[indexPath.row])
        cell.imageView?.image = imageName
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
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        self.searchBar.showsCancelButton = true
//    }
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//        searchBar.text = ""
//        searchBar.resignFirstResponder()
//        tableView.reloadData()
    //    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let listOfDoctorsVC = ListOfDoctorsViewController()
        
        self.navigationController?.pushViewController(listOfDoctorsVC, animated: true)
    }
    


}
