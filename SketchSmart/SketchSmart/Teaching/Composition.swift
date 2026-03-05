//
//  ColorTeory.swift
//  SketchSmart
//
//  Created by Елизавета on 23.05.2025.
//

import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct Composition: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("cmp1")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("cmp2")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("cmp3")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        HStack{
                            Spacer()
                            
                            Image("Image 9")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .cornerRadius(20)
                            
                            Spacer()
                        }
                        
                        Text("cmp4")
                            .foregroundStyle(.white)
                        
                        Text("cmp5")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        HStack{
                            Spacer()
                            
                            Image("Image 11")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .cornerRadius(20)
                            
                            Spacer()
                        }
                        
                        Text("cmp6")
                            .foregroundStyle(.white)
                        
                        Text("cmp7")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        
                        HStack{
                            Spacer()
                            
                            Image("Image 10")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .cornerRadius(20)
                            
                            Spacer()
                        }
                        
                        Text("cmp8")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}
