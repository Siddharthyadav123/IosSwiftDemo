//
//  SelectCityViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 4/28/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class SelectCityViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource {
    
  
    
    let section = ["India","Phikilippines","Indonesia","Malaysia","Brazil","Singapore"]
    
//    += [UIImage(named: "logo.png")!, UIImage(named: "logo2.png")!]
//    let itemsimage = [UIImage(named: "flag")!,(named: "imagesflag1"),(named: "flag2"),(named: "flag3"),(named: "flag4"),(named: "flag5")]
    
    
    var picture:[UIImage] = [
        UIImage(named: "flag.jpg")!,
        UIImage(named: "imagesflag1.jpeg")!,
        UIImage(named: "flag2.png")!,
        UIImage(named: "flag3.png")!,
        UIImage(named: "flag4.png")!,
        UIImage(named: "flag5.png")!,]
    
    let items = [["Banglore", "Agra", "Ahmedabad","Allahbad","Aurangabad","Amritsar","Bhopal","Chandigarh","Chennai","Coimbatore","Delhi","Ernakulam","Faridabad","Ghaziyabad","Gurgaon","Hydrabad","Indore","Jaipur","Jodhpur","Kanpur","Kanpur Nagar","Kolkata","Lucknow","Ludhiana","Meerut","Mohali","Mumbai","Nagpur","Nashik",
        "Navi Mumbai","Noida","Panchkula","Patna","Puducherry","Pune","Raipur","Rajkot","Ranchi","Surat",
        "Thane","Thiruvanathampuram","Vodora","Varanasi","Vijaywada","Vishakhapatnam"], ["Batangas", "Cavite", "Metro Manila"] ,["Bagor", "Depok", "Jakarta"], ["Kuala Lumpa", "Petaling Jaya", "Puchong","Shah Alam","Subang Jaya"],["Sao Paula"], ["Singapore"]]
    
    
    @IBAction func searchButton(sender: AnyObject) {
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mainViewCOntainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setAttributes()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
    * To register Nib
    */
    
    func setAttributes(){
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        self.tableView.tableFooterView = UIView()
    }
    
    
    
    /*
    *  Method for header title
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
       return self.section [section ]
        
    }
    
    /*
    * adding image in sectiion view
    */
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        let vw = UIView()
        vw.backgroundColor = Utils.hexStringToUIColor("#E5E4E2")
        let frame = CGRectMake(4,4,25,20)
        let headerImageView = UIImageView(frame: frame)
        let image: UIImage = self.picture [section ]
        headerImageView.image = image
        vw.addSubview(headerImageView)
        
        let uilblFrame = CGRectMake(40,0,120,28)
        let uilbl = UILabel(frame: uilblFrame)
        //uilbl.numberOfLines = 0
        //uilbl.lineBreakMode = NSLineBreakMode.ByWordWrapping
        uilbl.text = self.section [section ]
        vw.addSubview(uilbl)
        uilbl.backgroundColor =  UIColor .clearColor()
        return vw
        
        
        
    }
    
    
    
    
    /*
    *  Method for header title color
    */
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        // This changes the header background
        view.tintColor = Utils.hexStringToUIColor("#E5E4E2")
        
       

        //UIColor.lightGrayColor()
        
    }
    
    /*
    *  Method for number of sections
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return self.section.count
      
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items [section ].count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        return cell
        
    }
       
}
