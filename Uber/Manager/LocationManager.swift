//
//  LocationManager.swift
//  Uber
//
//  Created by Omkar Anarse on 21/01/24.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    @Published var userLocation : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
        //Gives most acuurate location on the user
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Requsting user for sharing location
        locationManager.requestWhenInUseAuthorization()
        //Start updating user location
        locationManager.startUpdatingLocation()
        
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.userLocation = location.coordinate
        locationManager.stopUpdatingLocation()
    }
}
