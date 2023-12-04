//
//  Location.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 11/14/23.
//

import Foundation
import CoreLocation
struct Location: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(location: CLLocationCoordinate2D) {
        self.id = UUID()
        self.location = location
    }
}
