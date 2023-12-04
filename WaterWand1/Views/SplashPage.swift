//
//  SplashPage.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 7/25/23.
//

import SwiftUI

struct SplashPage: View {
    @State var isActive = false
    @State var size = 0.8
    @State var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Image("MainBackground")
                .resizable()
                
                VStack {
                    VStack {
                        Image("FIULogo")
                        .padding(.all)
                        
                        Image("WaterWand_Icon")
                        .resizable()
                        .frame(width: 150.0, height: 205.0)
                        .padding(.all)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    }
                }
                .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
            }
            
        }
    }

struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}
