//
//  VideoFirst.swift
//  SketchSmart
//
//  Created by Елизавета on 16.06.2025.
//

import AVFoundation
import SwiftUI
import AVKit

struct VideoFirst: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.babyYellow]
    }
    
    private let videoURL = URL(string: "https://raw.githubusercontent.com/NovikovaLzbth/VideoColor/main/78512b59f440f477_compressed_watermarkless.mp4")!
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(height: 220)
                .onAppear {
                    AVPlayer(url: videoURL).play()
                }
        }
    }
}
