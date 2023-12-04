//
//  LocationMapView.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 11/14/23.
//

import SwiftUI
import MapKit
import CoreLocationUI
struct LocationMapView: View {
    @EnvironmentObject private var locationManager: LocationViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationManager.region,
                showsUserLocation: true, annotationItems: locationManager.locationArray) { place in
                MapAnnotation(coordinate: place.location) {
                    Image("WaterWand_Icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }
            }
            .ignoresSafeArea()
            .tint(.pink)
        }
    }
}
struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
