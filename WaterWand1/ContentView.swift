//
//  ContentView.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            About()
            .tabItem() {
                    Image(systemName: "info.square")
                    Text("About")
            }
            LocationMapView()
            .tabItem() {
                    Image(systemName: "map")
                    Text("Map")
            }
            Data()
            .tabItem() {
                    Image(systemName: "chart.xyaxis.line")
                    Text("Data")
            }
        }.background(.thinMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
