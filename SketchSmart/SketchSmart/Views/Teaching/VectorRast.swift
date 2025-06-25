//
//  VectorRast.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct VectorRast: View {
    
    private let videoURL = URL(string: "https://raw.githubusercontent.com/NovikovaLzbth/VideoColor/main/0625.mp4")!
    
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
                        .padding(.bottom, 50)
                        
                        VStack {
                            Text("Видеоурок №1")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title.bold())
                                .foregroundStyle(.babyYellow)
                            
                            VideoPlayer(player: AVPlayer(url: videoURL))
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(14)
                                .onAppear {
                                    AVPlayer(url: videoURL).play()
                                }
                        }
                        .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}
