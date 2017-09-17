//
//  UpdateLocation.swift
//  TouristTracker
//
//  Created by Daniel Alderman on 17/09/2017.
//  Copyright © 2017 Daniel Alderman. All rights reserved.
//

import UIKit
import CoreLocation

class UpdateLocation: CLLocationManager, CLLocationManagerDelegate {
    
    let requiredAccuracy: CLLocationAccuracy = 100.0
    
    var locManager = CLLocationManager()
    var locHeading = CLHeading()
    
    // Get coordinates for the location
    func getLocation(_ locManager: CLLocationManager, didUpdateLocations locations: [AnyObject]!)->NSArray{
        let locValue : CLLocationCoordinate2D = locManager.location!.coordinate
        let long = locValue.longitude
        let lat = locValue.latitude
        let locArray = [lat, long]
        return locArray as NSArray
    }
}
