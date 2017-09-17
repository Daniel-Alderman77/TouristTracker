//
//  MapViewController.swift
//  TouristTracker
//
//  Created by Daniel Alderman on 12/09/2017.
//  Copyright © 2017 Daniel Alderman. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    let updateLocation = UpdateLocation()
    
    override func viewDidAppear(_ animated: Bool) { // Start updating the location when view appears.
        updateLocation.startUpdatingLocation()
        
        print("Updating Location")
    }

    func getManager()->CLLocationManager{ // Since a function is needed to call UpdateLocation's locManager.
        let manager = updateLocation.locManager
        return manager
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            let manager = getManager() // Gets the locManager
            let locArray = updateLocation.getLocation(manager, didUpdateLocations: ["" as AnyObject]) // Gets the array with lat and lon
            mapView.mapType = .satellite // Type of map is a satellite one
            mapView.isPitchEnabled = false
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(locArray[0] as! NSNumber), longitude: CLLocationDegrees(locArray[1] as! NSNumber)) // Using the lat and lon and converting them to NSNumbers
            let region = MKCoordinateRegionMakeWithDistance(location, 1000.0, 1000.0)
            mapView.setRegion(region, animated: true)
            let dropPin = MKPointAnnotation() // Create a drop pin
            dropPin.coordinate = location // Drop pin should be at the current location
            mapView.addAnnotation(dropPin) // Drop pin being placed
        }
    }
}
