//
//  AddressViewController.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 4/8/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import Foundation
import UIKit
import SObjectKit
import MapKit

@IBDesignable
class AddressViewController : UIView {
    
    public var sobjectdata : Address? {
        didSet {
            streetLabel.text = sobjectdata?.street
            cityLabel.text = sobjectdata?.city
            countryLabel.text = ""
            zipLabel.text = sobjectdata?.zip
            stateLabel.text = sobjectdata?.state
            
            geolocation = CLLocation(latitude: sobjectdata!.latitude, longitude: sobjectdata!.longitude)
            centerMapOnLocation(location: geolocation!)
            
            
        }
    }
    
     private var regionRadius: CLLocationDistance = 150
    
    @IBInspectable var mapRadius : Int = 150 {
        didSet {
            regionRadius = CLLocationDistance(mapRadius)
        }
    }
   
    //Shipping or Billing
    @IBInspectable let addressType : String? = "Shipping"
    
    var geolocation : CLLocation?
    let locationManger:CLLocationManager = CLLocationManager()
    
    
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        streetLabel?.textColor = ColorPalette.primaryDark
        cityLabel?.textColor = ColorPalette.primaryDark
        zipLabel?.textColor = ColorPalette.primaryDark
        stateLabel?.textColor = ColorPalette.primaryDark
        countryLabel?.textColor = ColorPalette.primaryDark
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = location.coordinate
        objectAnnotation.title = "\(addressType!) Address"
        self.mapView.addAnnotation(objectAnnotation)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
