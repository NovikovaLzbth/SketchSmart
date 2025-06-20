//
//  ColorTeory.swift
//  SketchSmart
//
//  Created by Елизавета on 23.05.2025.
//

import SwiftUI
import CoreData

struct ColorTeory: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("color1")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("color2")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color3")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color4")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color5")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 9")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Image("Image 10")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("color6")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color7")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color8")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color9")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color10")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("color11")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 11")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                    }
                    // Растягивает VStack и выравнивает контент
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}
