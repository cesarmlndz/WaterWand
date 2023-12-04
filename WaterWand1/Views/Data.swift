//
//  Data.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 7/19/23.
//

import SwiftUI
import CoreLocation

struct Data: View {
    @State private var receivedData = ""
    @EnvironmentObject private var locationManager: LocationViewModel

    @State private var swiftDictionary: [String: Any]? = nil
    
    @State private var depthValue = "Depth:                         "
    @State private var temperatureValue = "Temperature: "
    @State private var turbidityValue = "Turbidity: "
    @State private var conductivityValue = "Conductivity: "
    
    @State private var fetchedOn = "Fetched On:                                                 "
    @State private var locationText = "Location: "
    
    @State var popupShown: Bool = false
    
    @State var loading: Bool = false
        
    /* Fetching Data from Raspberry Pi */
    func fetchData() {
            loading = true
            guard let url = URL(string: "http://192.168.4.1:5000/get_data") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.receivedData = responseString
                        do {
                           if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                               self.swiftDictionary = jsonObject
                               
                               depthValue = "Depth: \(self.swiftDictionary?["Depth"] as! String)"
                               
                               temperatureValue = "Temperature: \(self.swiftDictionary?["Temperature"] as! String)"
                               
                               turbidityValue = "Turbidity: \(self.swiftDictionary?["Turbidity"] as! String)"
                               
                               conductivityValue = "Conductivity: \(self.swiftDictionary?["Conductivity"] as! String)"
                               
                               fetchedOn = "Fetched On: \(formattedCurrentDate())"
                               
                               if let location = locationManager.location {
                                   locationText = "Location: \(location.latitude), \(location.longitude)"
                               }
                                         
                               loading = false
                           }
                       } catch {
                           print("Error deserializing JSON: \(error)")
                       }
                    }
                }
            }.resume()
    }
    
    /* Getting current date */
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            return formatter
        }()
    
    func formattedCurrentDate() -> String {
            let currentDate = Date()
            return dateFormatter.string(from: currentDate)
    }
    
    /* Converting Python dictionary into a Swift dictionary */
    func dictionaryAsString() -> String {
            if let dictionary = self.swiftDictionary {
                return String(describing: dictionary)
            } else {
                return ""
            }
    }
    
    /* Rendering the UI */
    var body: some View {
        ZStack {
            Image("BlueGradient")
                .resizable()
        
            VStack (spacing: 20) {
                Button(action: {
                        popupShown = false
                        }) {
                        HStack(spacing: 10) {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 24))
                                .foregroundColor(.blue)
                            Text("How to use")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 3)
                    }
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    Text("Sampling Data")
                        .font(.system(size: 20.0))
                        .bold()
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text(fetchedOn)
                        
                        Text(locationText)
                         
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 3)
                        .padding(.bottom)

                    
                    Text("Water Data")
                        .font(.system(size: 20.0))
                        .bold()
                    
                    Button(action: {
                        locationManager.requestLocation()
                        fetchData()
                            }) {
                                if loading == true {
                                    ProgressView("Sampling...") 
                                       .progressViewStyle(CircularProgressViewStyle())
                                       .padding(3)
                                } else { 
                                    HStack(spacing: 10) {
                                        Image(systemName: "arrow.clockwise.circle")
                                            .font(.system(size: 24))
                                            .foregroundColor(.white)
                                        Text("Start Sampling")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 3)
                                }
                               
                            }
         
                        VStack (alignment: .leading, spacing: 10) {
                            Text(depthValue)
                            Text(temperatureValue)
                            Text(turbidityValue)
                            Text(conductivityValue)
                             
                        }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 3)
                            .padding(.bottom)
                    
                    
                }
               
                
                Image("WaterWand_Icon")
                    .resizable()
                    .frame(width: 160.0, height: 200.0)
                
            }// end VStack1
    
        } // end Z-stack
        .overlay(
           ZStack {
               if !popupShown {
                   Color.black.opacity(0.5)
                       .edgesIgnoringSafeArea(.all)

                   VStack (alignment: .leading) {
                       Text("Welcome to Your Data!")
                           .font(.title)
                           .foregroundColor(.white)
                           .padding()
                       
                       Text("How to Use:")
                           .font(.system(size: 21.0))
                           .bold()
                           .foregroundColor(.white)
                           .padding()
                       
                       Text("1. Turn on Water Wand through power switch.")
                           .font(.system(size: 19.0))
                           .bold()
                           .foregroundColor(.white)
                           .padding()
                       
                       Text("2. On your mobile device, connect to 'WaterWandFIU' Wi-Fi. Password is 'WaterWand123'.")
                           .font(.system(size: 19.0))
                           .bold()
                           .foregroundColor(.white)
                           .padding()
                       
                       Text("3. Place Water Wand in desired sample area. Once ready, click the 'Start Sampling' button on this page to begin sampling.")
                           .font(.system(size: 19.0))
                           .bold()
                           .foregroundColor(.white)
                           .padding()
                       
                       Text("4. Wait for the results to come back and be displayed on this page.")
                           .font(.system(size: 19.0))
                           .bold()
                           .foregroundColor(.white)
                           .padding()

                       Button("Dismiss") {
                           popupShown = true
                       }
                       .foregroundColor(.white)
                       .padding()
                   }
                   .background(Color.blue)
                   .cornerRadius(10)
                   .padding(20)
               }
           }
       )
    }
}

struct Data_Previews: PreviewProvider {
    static var previews: some View {
        Data()
    }
}
