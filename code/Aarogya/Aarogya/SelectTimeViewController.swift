//
//  SelectTimeViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/17/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class SelectTimeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    var Pageindex : Int!
    var sectionImagesArray = ["mor.png","sun.png","moon.png","night.png",""]
    var sectionTimeArray = ["before 12 pm", "12 - 4 pm", "4 - 8 pm", "after 8 pm",""]
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayForBool : NSMutableArray = NSMutableArray()
    var sectionTitleArray : NSMutableArray = NSMutableArray()
    var sectionContentDict : NSMutableDictionary = NSMutableDictionary()
    var firstSectionRow : NSMutableArray = NSMutableArray()
    var secondSectionRow : NSMutableArray = NSMutableArray()
    var thirdSectionRow : NSMutableArray = NSMutableArray()
    var fourthSectionRow : NSMutableArray = NSMutableArray()
    var pagerData : NSMutableArray = NSMutableArray()
    var pageIndex : Int = 0
    var titleText : String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.setAttributes()
        self.ArrayValues()
       // self.pager()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Method for label in pager
    
//    func pager(){
//        let label = UILabel(frame: CGRectMake(0, 0, view.frame.width, 200))
//        label.textColor = UIColor.whiteColor()
//        label.text = titleText
//        label.textAlignment = .Center
//        view.addSubview(label)
//       
//    }
    
    
    // Method for array data
    func ArrayValues()
    {
        //be in method
        arrayForBool = [false,false,false,false,false]
        sectionTitleArray = ["Morning", "Afternoon", "Evening", "Night",""]
        firstSectionRow = ["10.00 am", "10.30 am", "11.00 am"]
        
        var string1 = sectionTitleArray.objectAtIndex(0) as? String
        [sectionContentDict .setValue(firstSectionRow, forKey:string1! )]
        
        secondSectionRow = ["12.00 pm", "12.30 pm", "1.00 pm"]
        string1 = sectionTitleArray .objectAtIndex(1) as? String
        [sectionContentDict .setValue(secondSectionRow, forKey:string1! )]
        
        thirdSectionRow = ["5.00 pm", "5.30 pm", "6.00 pm", "6.30 pm"]
        string1 = sectionTitleArray .objectAtIndex(2) as? String
        [sectionContentDict .setValue(thirdSectionRow, forKey:string1! )]
        
        fourthSectionRow = ["8.00 pm", "8.30 pm"]
        string1 = sectionTitleArray .objectAtIndex(3) as? String
        [sectionContentDict .setValue(fourthSectionRow, forKey:string1! )]
          //print(">>>> Dictionary Data ",sectionContentDict)
        
        pagerData = ["Today,19 May","Fri,20 May","Sat,21 May","Sun,22 May","Mon,23 May","Tue,24 May","Wed,25 May"]
        
        
    }
    
    func setAttributes(){
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "selectTime")
        self.tableView.tableFooterView = UIView()
        let yourNibName = UINib(nibName: "SelectTimeTableViewCell", bundle: nil)
        tableView.registerNib(yourNibName, forCellReuseIdentifier: "Cell")
    }
    
    
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitleArray.objectAtIndex(section) as? String
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return sectionTitleArray.count;
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        arrayForBool .objectAtIndex(indexPath.section)
        if (arrayForBool .objectAtIndex(indexPath.section).boolValue == true) {
            return 49;
        }
        return 0;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if(arrayForBool .objectAtIndex(section).boolValue == true){
        //            var tps = sectionTitleArray.objectAtIndex(section) as! String
        //            var count1 = (sectionContentDict.valueForKey(tps)) as! NSArray
        //            return count1.count
        
        switch section {
        case 0  :
            return firstSectionRow.count
        case 1  :
            return secondSectionRow.count
        case 2  :
            return thirdSectionRow.count
        case 3  :
            return fourthSectionRow.count
        default : break
            //            print( "default case")
            
        }
        
        return 0;
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 42))
        let label = UILabel(frame: CGRect(x:36, y: 0, width: tableView.frame.size.width-10, height: 40))
        label.text = sectionTitleArray.objectAtIndex(section) as? String
        label.textColor = UIColor.blackColor()
         label.font = label.font.fontWithSize(13)
        sectionView.backgroundColor = UIColor.whiteColor()
        
        sectionView.addSubview(label)
        
        
        let frame = CGRectMake(4,10,20,20)
        let headerImageView = UIImageView(frame: frame)
        print("image is not there")
        let imageName = UIImage(named: sectionImagesArray[section] as! String)
        headerImageView.image = imageName
        sectionView.addSubview(headerImageView)
        
        let labelTime = UILabel(frame: CGRect(x:100, y: 0, width: tableView.frame.size.width-10, height: 40))
        labelTime.text = self.sectionTimeArray [section ]
        labelTime.textColor = UIColor.lightGrayColor()
        labelTime.font = labelTime.font.fontWithSize(12)
        sectionView.backgroundColor = UIColor.whiteColor()
        sectionView.addSubview(labelTime)

        
        //*************adds the separator here
        if(section < sectionTitleArray.count-1){
            //adds the separator for all sections except last one.
            let separatorLineView =  UIView(frame: CGRect(x: 35, y: 41, width: tableView.frame.size.width-15, height: 1))
            
            //        [[UIView alloc] initWithFrame:CGRectMake(15, 40, _expandableTableView.frame.size.width-15, 1)];
            separatorLineView.backgroundColor = UIColor .lightGrayColor()
            sectionView.addSubview(separatorLineView)
        }
        //sets section to the tag here to  identify on tap.
        sectionView.tag = section;
        
        /********** Add UITapGestureRecognizer to SectionView   **************/
        let tap = UITapGestureRecognizer(target: self, action: Selector("sectionHeaderTapped:"))
        
        sectionView.addGestureRecognizer(tap)
        return sectionView;
        
    }
    
    //    #pragma mark - Table header gesture tapped
    
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer) {
        print("Tapping")
        print(gestureRecognizer.view?.tag)
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection:(gestureRecognizer.view!.tag as Int!)!)
        if (indexPath.row == 0) {
            let collapsed = arrayForBool .objectAtIndex(indexPath.section).boolValue
            
            let isExpanding = !collapsed
            //            collapsed = !collapsed;
            //            arrayForBool .replaceObjectAtIndex(indexPath.section, withObject: collapsed)
            
            for (var ind=0;ind<sectionTitleArray.count;ind++) {
                if (indexPath.section==ind) {
                    arrayForBool .replaceObjectAtIndex(ind, withObject: isExpanding)
                }else if(isExpanding){
                    var collapsed = arrayForBool .objectAtIndex(ind).boolValue
                    collapsed = !collapsed;
                    arrayForBool .replaceObjectAtIndex(ind, withObject: false)
                }
                
                let range = NSMakeRange(gestureRecognizer.view!.tag as Int!, 1)
                let indexSet = NSIndexSet(indexesInRange: range)
                self.tableView .reloadSections(indexSet, withRowAnimation:UITableViewRowAnimation.Automatic)
                tableView.reloadData()
            }
        }
        
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
            }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "SelectTimeTableViewCell"
        
        var cell: SelectTimeTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? SelectTimeTableViewCell
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "SelectTimeTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? SelectTimeTableViewCell
        }
        print(">>>>> custom Cell instance", cell)
        let string1 = sectionTitleArray.objectAtIndex(indexPath.section) as? String
        print("Dictionary: \(sectionContentDict)")
        
        let rowContents = sectionContentDict .objectForKey(string1!) as? NSMutableArray
        cell.txtLabel?.text = rowContents!.objectAtIndex(indexPath.row) as! String
        cell.txtLabel1?.text = rowContents!.objectAtIndex(indexPath.row) as! String
        return cell
        
    }
    
    
}


