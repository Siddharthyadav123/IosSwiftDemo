//
//  ConsultViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/8/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class ConsultViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate

{
    
    var data = ["Skin Allergy","Boil near knee","Front 4 tooth decay","Leg pain on left leg"]
    
    var filteredData: [String]!
    
    var isBottomButtVisible = true
    
    var homeScreenViewController:HomeScreenViewController!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableViewContainerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var askFreeQueButton: UIButton!
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var searchContainerView: UIView!
    
    
    
    
    @IBAction func askFreeQuestion(sender: AnyObject) {
        let askFreeQuestionViewController = AskFreeQuestionViewController()
        self.presentViewController(askFreeQuestionViewController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        //updateLabel()
       
    }
    
    
    
    func updateLabel(){
        let consultTableViewCell = ConsultTableViewCell()
        //let indexOfA = data.indexOf("Skin Allergy")
       

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func setAttributes(){
        let yourNibName = UINib(nibName: "ConsultTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "consultIdentifier")
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        
        //sets the tap gesture to the table view's container view.
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap"))
        //        tap.delegate = self
        tableViewContainerView.addGestureRecognizer(tap)
        
  
    }
    
    
    /*
    * Handles the tap for the tableview container view.
    */
    func handleTap(){
        print("OnView Tappped!!!")
        if isBottomButtVisible{
            //if its visible, then hide it
            hideBottomButton()
            hideSearchContainer()
            resizeTableViewFrame(true)
            
        }else{
            //it is hidden, so make it visible
            resizeTableViewFrame(false)
            showBottomButton()
            showSearchContainerButton()
        }
    }
    
    
    /*
    *   Hide bottom button with animation.
    */
    func hideBottomButton(){
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: .BeginFromCurrentState, animations: {
            self.askFreeQueButton.frame = CGRectMake(self.askFreeQueButton.frame.origin.x, (self.askFreeQueButton.frame.origin.y+self.askFreeQueButton.frame.size.height), self.askFreeQueButton.frame.size.width, self.askFreeQueButton.frame.size.height)
            }, completion: { finished in
        })
        self.isBottomButtVisible = false
        
    }
    
    
    /*
    *   Hide bottom button with animation.
    */
    func showBottomButton(){
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: .BeginFromCurrentState, animations: {
            self.askFreeQueButton.frame = CGRectMake(self.askFreeQueButton.frame.origin.x, (self.askFreeQueButton.frame.origin.y-self.askFreeQueButton.frame.size.height), self.askFreeQueButton.frame.size.width, self.askFreeQueButton.frame.size.height)
            }, completion: { finished in
        })
        self.isBottomButtVisible = true
        
    }
    
    
    /*
    *   Hide search button with animation.
    */
    func hideSearchContainer(){
        //first bring the header view to the front.
        parentView .bringSubviewToFront(searchContainerView)
        homeScreenViewController .bringHeaderToFront()
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: .BeginFromCurrentState, animations: {
            self.searchContainerView.frame = CGRectMake(self.searchContainerView.frame.origin.x, (self.searchContainerView.frame.origin.y-self.searchContainerView.frame.size.height), self.searchContainerView.frame.size.width, self.searchContainerView.frame.size.height)
            }, completion: { finished in
        })
        self.isBottomButtVisible = false
        
    }
    
    /*
    * Resizes the tableview frame.
    */
    func resizeTableViewFrame(isHidden:Bool){
        let headerHeight = self.searchContainerView.frame.size.height
        let bottomButtHeight = self.askFreeQueButton.frame.size.height
        
        if isHidden{
            //if it is going to be hiddent then expand it
            UIView.animateWithDuration(0.4, delay: 0.0, options: .BeginFromCurrentState, animations: {
                self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, (self.tableView.frame.origin.y-headerHeight), self.tableView.frame.size.width, self.tableView.frame.size.height+headerHeight+bottomButtHeight)
                
                }, completion: { finished in
            })
            
        }else {
            //otherwise reduce height
            UIView.animateWithDuration(0.4, delay: 0.0, options: .BeginFromCurrentState, animations: {
                self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, (self.tableView.frame.origin.y+headerHeight), self.tableView.frame.size.width, self.tableView.frame.size.height-headerHeight-bottomButtHeight)
                }, completion: { finished in
            })
        }
    }
    /*
    *   Hide bottom button with animation.
    */
    func showSearchContainerButton(){
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: .BeginFromCurrentState, animations: {
            self.searchContainerView.frame = CGRectMake(self.searchContainerView.frame.origin.x, (self.searchContainerView.frame.origin.y+self.searchContainerView.frame.size.height), self.searchContainerView.frame.size.width, self.searchContainerView.frame.size.height)
            }, completion: { finished in
        })
        self.isBottomButtVisible = true
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 4;
        return filteredData.count

    }
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:ConsultTableViewCell! = tableView.dequeueReusableCellWithIdentifier("consultIdentifier", forIndexPath:indexPath)as! ConsultTableViewCell
        
         //cell.skinAllergyLabel?.text = filteredData[indexPath.row]
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "ConsultTableViewCell", bundle: nil), forCellReuseIdentifier: "consultIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("consultIdentifier") as? ConsultTableViewCell
        }
        
        cell.skinAllergyLabel.text = filteredData[indexPath.row]
        cell.consultViewController = self
        return cell;
    }
    
   
    
    // this function is for searchBar
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        self.searchBar.showsCancelButton = true
//    }
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//        searchBar.text = ""
//        searchBar.resignFirstResponder()
//        tableView.reloadData()
    //    }
   

    
    var displacement = 656
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //        var currentOffset = scrollView.contentOffset.y
        //            var maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        //
        //            // Change 10.0 to adjust the distance from bottom
        ////        var tempDisplacement = (maximumOffset - currentOffset)
        //        print("Scrolled !!!")
        //print("Scrolled !!!\((maximumOffset - currentOffset))")
        //            if maximumOffset - currentOffset <= 10.0 {
        //                print("Scrolled ???\((maximumOffset - currentOffset))")
        //            }
    }
    
    
    // This method updates filteredData based on the text in the Search Box
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

 
}

//- (void)scrollViewDidScroll: (UIScrollView *)scroll {
//    // UITableView only moves in one direction, y axis
//    CGFloat currentOffset = scroll.contentOffset.y;
//    CGFloat maximumOffset = scroll.contentSize.height - scroll.frame.size.height;
//
//    // Change 10.0 to adjust the distance from bottom
//    if (maximumOffset - currentOffset <= 10.0) {
//        [self methodThatAddsDataAndReloadsTableView];
//    }
//}




