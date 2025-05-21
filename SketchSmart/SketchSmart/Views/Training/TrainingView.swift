//
//  TrainingView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct TrainingView: View {
    @StateObject var viewModel: TrainingViewModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: TrainingViewModel(storage: storage))
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.babyYellow]
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(.vertical) {
                    }
                }
                .navigationTitle("Обучение")
            }
        }
    }
}
