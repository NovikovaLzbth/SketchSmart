//
//  Psychology.swift
//  SketchSmart
//
//  Created by Елизавета on 23.05.2025.
//

import SwiftUI
import CoreData

struct Psychology: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("psy1")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("psy2")
                            .foregroundStyle(.white)
                            .bold(true)
                            .padding(.bottom)
                        
                        Text("psy3")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Text("psy4")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 5")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("psy5")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("psy6")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 7")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("psy7")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 8")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.leading, 9)
                            .padding(.bottom)
                        
                        Text("psy8")
                            .foregroundStyle(.white)
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
