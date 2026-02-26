//
//  Third.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI
import CoreData

struct Third: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    //Установка цвета фона
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) { 
                        }
                        .padding(.horizontal) // Отступы по бокам для ScrollView
                    }
                }
            }
            .navigationTitle("Тест прототипы")
        }
    }
}
