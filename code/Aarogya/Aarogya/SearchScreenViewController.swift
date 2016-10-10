//
//  SearchScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/22/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class SearchScreenViewController: BaseViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        tableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setAttributes(){
        let yourNibName = UINib(nibName: "SearchScreenTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "searchScreenIdentifier")
        self.title = "Search"
    }
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:SearchScreenTableViewCell! = tableView.dequeueReusableCellWithIdentifier("searchScreenIdentifier", forIndexPath:indexPath)as! SearchScreenTableViewCell
        
        
        
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "SearchScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "searchScreenIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("searchScreenIdentifier") as? SearchScreenTableViewCell
        }
        cell.seacrhScreenVC = self
        return cell;
    }
    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        self.searchBar.showsCancelButton = true
//    }
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//        searchBar.text = ""
//        searchBar.resignFirstResponder()
//    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
  
    
}
