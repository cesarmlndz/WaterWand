//
//  WaterWand1App.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 7/19/23.
//

import SwiftUI

@main
struct WaterWand1App: App {
    @StateObject var locationManager = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            SplashPage()
                  .environmentObject(locationManager)
        }
    }
}
