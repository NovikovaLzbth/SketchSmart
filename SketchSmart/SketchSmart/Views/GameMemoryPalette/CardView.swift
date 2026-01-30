//
//  CardView.swift
//  SketchSmart
//
//  Created by Елизавета on 24.12.2025.
//

import Foundation
import SwiftUI
import AVFoundation
import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(card.isFaceUp || card.isMatched ? card.color : Color.lightGray)
            
            if card.isFaceUp || card.isMatched {

                RoundedRectangle(cornerRadius: 8)
                    .fill(card.color)
                    .padding(4)
                Image(systemName: "checkmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            } else {
                Image(systemName: "questionmark")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .scaleEffect(x: -1)
            }
        }
        .rotation3DEffect(
            .degrees(card.isFaceUp || card.isMatched ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut(duration: 0.3), value: card.isFaceUp)
    }
}

