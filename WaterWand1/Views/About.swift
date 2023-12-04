//
//  About.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 7/19/23.
//

import SwiftUI

struct About: View {
    var body: some View {
        ZStack {
            Image("MainBackground")
                .resizable()
        
            VStack {
                Image("FIU_IoE")
                .resizable()
                .frame(height: 100.0)
                .padding(.bottom)
                
                Text("Water Wand")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .mask(Text("Water Wand").font(.system(size: 40, weight: .bold))
                    ) 
                
                Text("Crowdsourced Hydometry")
                    .foregroundStyle(.blue)
                    .font(.system(size: 20.0))
                    .bold()
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Research Sponsor: FIU Institute of Environment")
                        .font(.system(size: 17, weight: .bold))
                    
                    Text("Project Lead: Dr. Biayna Bogosian")
                        .font(.system(size: 17, weight: .bold))
                    
                    Text("Project Mentor: Dr. Atoussa H. Tehrani")
                        .font(.system(size: 17, weight: .bold))
                    
                    Text("Urban flooding in cities like Miami, worsened by global warming and rising sea levels, demands effective citizen engagement. Water Wand is a crowdsourced hydrometry effort composed of a mobile application and a portable sensing device that empowers citizens to gather and share water data with their community and stakeholders..")
                        .font(.system(size: 17))
                } // end VStack2
                
            }.frame(width: 350) // end VStack1
    
        } // end ZStack
    } // end Body
} // end View

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
