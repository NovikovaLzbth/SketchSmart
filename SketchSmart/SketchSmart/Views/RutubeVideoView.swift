//
//  RutubeVideoView.swift
//  SketchSmart
//
//  Created by Елизавета on 18.06.2025.
//

import Foundation
import SwiftUI
import SafariServices

struct RutubeVideoView: UIViewControllerRepresentable {
    let videoURL: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        guard let url = URL(string: videoURL) else {
            fatalError("Invalid URL")
        }
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
