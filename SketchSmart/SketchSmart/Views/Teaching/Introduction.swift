//
//  Introduction.swift
//  SketchSmart
//
//  Created by Елизавета on 22.11.2025.
//

import Foundation
import SwiftUI
import CoreData
import AVKit
import AVFoundation

struct Introduction: View {
    @State private var currentPage = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("introduction1")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom)
                        
                        // Прокуртка изображений с индикатором
                        TabView(selection: $currentPage) {
                            Image("Image 29")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .cornerRadius(13)
                                .tag(0)
                            
                            Image("Image 30")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .cornerRadius(13)
                                .tag(1)
                            
                            Image("Image 31")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .cornerRadius(13)
                                .tag(2)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 230)
                        
                        // Индикатор
                        HStack(alignment: .center, spacing: 8) {
                            ForEach(0..<3, id: \.self) { index in
                                Capsule()
                                    .fill(currentPage == index ? Color.white : Color.lightGray.opacity(0.5))
                                    .frame(
                                        width: currentPage == index ? 26 : 10,
                                        height: 10
                                    )
                                    .animation(.easeInOut(duration: 0.2), value: currentPage)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                        
                        Text("introduction2")
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 16)
                        
                        Text("introduction3")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding(.bottom, 5)
                        
                        Text("introduction4")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom, 5)
                        
                        Text("introduction5")
                            .foregroundStyle(.white)
                            .padding(.bottom, 5)
                    }
                    // Растягивает VStack и выравнивает контент
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    Introduction()
}
