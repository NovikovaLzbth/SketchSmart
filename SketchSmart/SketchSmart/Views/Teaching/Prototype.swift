//
//  Prototype.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct Prototype: View {
    
    private let videoURL = URL(string: "https://raw.githubusercontent.com/NovikovaLzbth/VideoColor/main/0623(1).mp4")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("prototype1")
                            .font(.title)
                            .bold(true)
                            .foregroundStyle(.babyYellow)
                            .padding(.bottom)
                        
                        Text("prototype2")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Image("Image 4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .cornerRadius(14)
                            .padding(.bottom)
                        
                        Text("prototype3")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        VStack {
                            Text("prototype4")
                                .bold()
                                .padding(.bottom)
                            
                            Text("prototype5")
                            
                            Text("prototype6")
                            
                            Text("prototype7")
                            
                            Text("prototype8")
                            
                            Text ("prototype9")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                        
                        Text("prototype10")
                            .foregroundStyle(.white)
                            .padding(.bottom, 50)
                        
                        VStack {
                            Text("Видеоурок №2")
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
