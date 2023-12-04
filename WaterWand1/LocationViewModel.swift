//
//  LocationViewModel.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 11/14/23.
//

import Foundation
import CoreLocation
import MapKit
class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var locationArray: [Location] = []
    @Published var region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.756990749470237, longitude: -80.37199746188294),
                                                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    override init() {
        super.init()
        manager.delegate = self
    }
    func requestLocation() {
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.first?.coordinate {
            location = newLocation
            locationArray.append(Location(location: newLocation)) // Add the new location to the array
            
            region = MKCoordinateRegion(center: newLocation,
                                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle the error here
        print("Location manager failed with error: \(error.localizedDescription)")
    }
}
