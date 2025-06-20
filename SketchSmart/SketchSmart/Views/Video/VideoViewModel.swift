//
//  VideoViewModel.swift
//  SketchSmart
//
//  Created by Елизавета on 16.06.2025.
//

import SwiftUI
import CoreData
import AVKit

class VideoViewModel: ObservableObject {
    var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var playerLayer : AVPlayerLayer? = nil
    
    let videoURL = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
    func setupPlayer() {
        guard let url = URL(string: videoURL) else { return }
        
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }
    
    func setupVideoPlayer() {
        let videoURL = URL(string: videoURL)!
        let asset = AVAsset(url: videoURL)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: playerItem)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = view.bounds
//        playerLayer.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(playerLayer)
        player.play()
    }
    
}

class VideoViewModel_: ObservableObject {
    var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    
    let videoURL = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
    func setupPlayer() {
        guard let url = URL(string: videoURL) else { return }
        
        player = AVPlayer(url: url)
        player?.play()
    }
    
    func stopPlayer() {
        player?.pause()
        player = nil
    }
}
