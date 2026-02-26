//
//  OverlayView.swift
//  SketchSmart
//
//  Created by Елизавета on 03.02.2026.
//

import Foundation
import SwiftUI

struct OverlayView: View {
    @Binding var isVisible: Bool
    @Binding var showOverlay: Bool
    @State private var showContent = false
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Color.darkBlue
                .opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture {
                    dismissHint()
                }
            
            if isVisible {
                VStack {
                    Image("Image 34")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .padding()
                    
                    Button("Понятно!") {
                        dismissHint()
                    }
                    .padding()
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.darkBlue)
                    .background(Color.background)
                    .cornerRadius(15)
                }
            }
        }
        .onAppear {
            viewModel.pauseTimer()
            
            // Анимация появления контента
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                showContent = true
            }
        }
    }
    
    private func dismissHint() {
        viewModel.resumeTimer()
        
        // Анимация исчезновения
        withAnimation(.easeOut(duration: 0.3)) {
            showContent = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                self.isVisible = false
                self.showOverlay = false
            }
        }
    }
}
