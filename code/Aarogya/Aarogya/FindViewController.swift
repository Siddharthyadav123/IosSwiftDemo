//
//  FindViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/8/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class FindViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    var data=["Doctors","Diagnostic labs","Salons & Wellness centres","Gyms & Fitness centres"]
    var dataimage=["medical","tool","scissor","gym"]
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        self.setAttributes()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // to register the xib
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("findAndBook", forIndexPath: indexPath) 
        //cell.textLabel?.text = "Doctors"
        cell.textLabel?.text = filteredData[indexPath.row]
        
        let imageName = UIImage(named: dataimage[indexPath.row])
        cell.imageView?.image = imageName
        resizeTableViewCellContents(cell)
        return cell
        
    }
    
    
    func resizeTableViewCellContents(cell:UITableViewCell){
        let itemSize:CGSize = CGSizeMake(22, 22)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.mainScreen().scale)
        let imageRect : CGRect = CGRectMake(0, 0, itemSize.width, itemSize.height)
        cell.imageView!.image?.drawInRect(imageRect)
        cell.imageView!.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            return dataString.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
        })
        
        if searchText.isEmpty {
            filteredData = data
        } else {
      
            filteredData = data.filter({(dataItem: String) -> Bool in
        
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
    
//      func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//             self.searchBar.endEditing(true)
//            searchBar.resignFirstResponder()
////        self.searchBar.showsCancelButton = false
//    }
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        print("cancel button tapped")
//
//        tableView.reloadData()
////        searchBar.showsCancelButton = false
//        searchBar.text = ""
//        searchBar.resignFirstResponder()
//
//    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        
        let findAndBookVC =  FindandBookViewController()
        
        self.navigationController?.pushViewController(findAndBookVC, animated: true)
    }
    


}


