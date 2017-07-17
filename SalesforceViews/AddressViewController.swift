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
//import MapKit
import Mapbox

@IBDesignable
class AddressViewController : UIView, MGLMapViewDelegate {
    
    let point = MGLPointAnnotation()
    
    public var sobjectdata : Address? {
        didSet {
            streetLabel.text = sobjectdata?.street
            cityLabel.text = sobjectdata?.city
            countryLabel.text  = ""
           
            zipLabel.text = sobjectdata?.zip
            stateLabel.text = sobjectdata?.state
            
            point.title = sobjectdata?.street
            point.subtitle = sobjectdata?.city
            point.coordinate = CLLocationCoordinate2D(latitude: sobjectdata!.latitude, longitude: sobjectdata!.longitude)
            configMap(location: point)
            
            
        }
    }
    
     private var regionRadius: CLLocationDistance = 150
    
   
    //Shipping or Billing
    @IBInspectable var title : String? = "Shipping" {
        didSet {
            titleLabel.text = title
        }
    }
    
    
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
   // @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapView: MGLMapView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mapView.delegate = self
       // streetLabel?.textColor = ColorPalette.primaryDark
        //cityLabel?.textColor = ColorPalette.primaryDark
        //zipLabel?.textColor = ColorPalette.primaryDark
        //stateLabel?.textColor = ColorPalette.primaryDark
        //countryLabel?.textColor = ColorPalette.primaryDark
        
        titleLabel.isHeader = true
        let theme  = ThemeManager.shared.currentTheme()
        self.backgroundColor = theme?.mainColor
        titleLabel.defaultFont = theme?.headerFont
        titleLabel.defaultTextColor = theme?.headerFontColor
        streetLabel.font = theme?.labelFont
        streetLabel.textColor = theme?.labelFontColor
        cityLabel.font = theme?.labelFont
        cityLabel.textColor = theme?.labelFontColor
        zipLabel.font = theme?.labelFont
        zipLabel.textColor = theme?.labelFontColor
        stateLabel.font = theme?.labelFont
        stateLabel.textColor = theme?.labelFontColor
        countryLabel.font = theme?.labelFont
        countryLabel.textColor = theme?.labelFontColor
        
    }
    
    
    func configMap(location: MGLPointAnnotation) {
        mapView.addAnnotation(location)
        mapView.setCenter(location.coordinate, zoomLevel: 13, animated: true)
        
    }
    
    /*
    //standard ios map kit
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = location.coordinate
        objectAnnotation.title = title
        self.mapView.addAnnotation(objectAnnotation)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
 
 */
}
