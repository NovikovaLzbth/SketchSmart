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
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBlue.ignoresSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text("introduction1")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom)
                        
                        Text("introduction2")
                            .font(.title3)
                            .foregroundStyle(.babyYellow)
                            .fontWeight(.bold)
                        
                        Image("ImgIntroduction1")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(9)
                            .padding(.bottom)
                        
                        Text("introduction3")
                            .font(.title3)
                            .foregroundStyle(.babyYellow)
                            .fontWeight(.bold)
                            .padding(.bottom, 3)
                        
                        Text("introduction4")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        
                        Text("introduction5")
                            .foregroundStyle(.white)
                            .padding(.bottom, 3)
                        
                        Text("introduction6")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        
                        Text("introduction7")
                            .foregroundStyle(.white)
                            .padding(.bottom, 3)
                        
                        Text("introduction8")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        
                        Text("introduction9")
                            .foregroundStyle(.white)
                            .padding(.bottom, 3)
                        
                        Text("introduction10")
                            .font(.title3)
                            .foregroundStyle(.babyYellow)
                            .fontWeight(.bold)
                            .padding(.bottom)
                    }
                    // Растягивает VStack и выравнивает контент
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    Introduction()
}
