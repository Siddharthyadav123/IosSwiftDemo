//
//  MyQueriesScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/22/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class MyQueriesScreenViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setAttributes(){
        let yourNibName = UINib(nibName: "MyQueriesTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "myQueriesIdentifier")
        self.title = "My Queries"
        self.navigationController?.navigationItem.backBarButtonItem?.title = "Back"
        
        let image = UIImage(named: "search")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:image, style:UIBarButtonItemStyle.Plain, target: self, action: "onSearchButtClicked")
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    // method to load custom cell in tableview controller
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:MyQueriesTableViewCell! = tableView.dequeueReusableCellWithIdentifier("myQueriesIdentifier", forIndexPath:indexPath)as! MyQueriesTableViewCell
        
        
        
        
        // This function actually loads the xib
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "MyQueriesTableViewCell", bundle: nil), forCellReuseIdentifier: "myQueriesIdentifier")
            cell = tableView.dequeueReusableCellWithIdentifier("myQueriesIdentifier") as? MyQueriesTableViewCell
        }
        cell.myQueriesVC = self
        return cell;
    }
    
    /*
    * Gets called on search icon clicked.
    */
    func onSearchButtClicked(){
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        navigationItem.backBarButtonItem = backButton
        let searchScreenViewController: SearchScreenViewController = SearchScreenViewController()
        
        self.navigationController!.pushViewController(searchScreenViewController, animated: true)
  
    }
    
    
    
}
