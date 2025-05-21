//
//  MainView.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct MainView: View {
    @StateObject private var viewModel: MainViewModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: MainViewModel(storage: storage))
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
                .navigationTitle("Тренажер")
            }
        }
    }
}

