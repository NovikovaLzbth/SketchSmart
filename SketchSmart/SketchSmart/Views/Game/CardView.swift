//
//  CardView.swift
//  SketchSmart
//
//  Created by Елизавета on 24.12.2025.
//

import Foundation
import SwiftUI
import AVFoundation

struct CardView: View {
    
    
    
    let card: Card
    
    var body: some View {
        ZStack {
            
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(card.isFaceUp || card.isMatched ? card.color : Color.gray.opacity(0.3))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    )
                
                if card.isMatched {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
                
                if !card.isFaceUp && !card.isMatched {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            Image(systemName: "questionmark")
                                .font(.title)
                                .foregroundColor(.white.opacity(0.7))
                        )
                }
                
            }
            .rotation3DEffect(
                .degrees(card.isFaceUp || card.isMatched ? 0 : 180),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: card.isFaceUp)
    //        .onAppear {
    //            showAutoHint()
    //        }
            
    //        private func showAutoHint() {
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    //                    self.showHintOvelay.toggle()
    //                }
    //
    //        }
        }
    }
    
}

