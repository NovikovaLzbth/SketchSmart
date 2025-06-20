//
//  VectorRast.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

struct VectorRast: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("vect1")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("vect2")
                            .foregroundStyle(.white)
                        
                        HStack {
                            Image("Image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                            
                            Image("Image 1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                        }
                        
                        Text("vect3")
                            .foregroundStyle(.white)
                        
                        HStack {
                            Image("Image 3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                            
                            Image("Image 2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .cornerRadius(10)
                        }
                        
                        VStack {
                            Text("vect4")
                                .padding(.bottom)
                            
                            Text("vect5")
                                .padding(.bottom)
                            
                            Text("vect6")
                                .padding(.bottom)
                            
                            Text("vect7")
                            
                            Text("vect8")
                        }
                        .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}
