//
//  CallViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 5/2/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class CallViewController: BaseViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    
    @IBOutlet weak var theMap: MKMapView!
    @IBOutlet weak var callButton: UIButton!
    
    @IBAction func callButton(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://80867417741")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttributes()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        //Setup our Map View
        theMap.delegate = self
        theMap.mapType = MKMapType.Standard
        theMap.showsUserLocation = true
        theMap.rotateEnabled = false
       
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAttributes(){
        self.title = "Contact Clinic"
        let image = UIImage(named: "signs.png")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:image, style:UIBarButtonItemStyle.Plain, target: self, action: "onRightButtonClicked")
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //theLabel.text = "\(locations[0])"
        myLocations.append(locations[0] )
        
//        let spanX = 0.007
//        let spanY = 0.007
//        let newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
//        theMap.setRegion(newRegion, animated: true)
        
        if (myLocations.count > 1){
            let sourceIndex = myLocations.count - 1
            let destinationIndex = myLocations.count - 2
            
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
            var a = [c1, c2]
            let polyline = MKPolyline(coordinates: &a, count: a.count)
            theMap.addOverlay(polyline)
        }
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 4
            return polylineRenderer
        }
        return nil
    }
    func onRightButtonClicked(){
        print("on right click")
        let alert = UIAlertView()
        alert.title = "Note:This call may be recorded for quality control purpose and call recording may be shared with the center you are trying to connect."
        alert.message = "If you could not connect with the center.Please call Arogya Helpline +9590908080(8 am to 7 pm, Monday to Saturday)"
        alert.addButtonWithTitle("Dismiss")
        alert.show()
    }

}
